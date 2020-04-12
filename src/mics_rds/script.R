

catalogue <- read.csv("depends/mics_survey_catalogue_filenames.csv",
                      na = "", stringsAsFactors = FALSE)
is_available <- !is.na(catalogue$datasets) & catalogue$datasets == "Available"

## assign ISO3 and survey_id

custom_matches <- c("Eswatini" = "SWZ",
                    "Kosovo under UNSC res. 1244" = "RKS",
                    "Kosovo under UNSC res. 1244 (Roma settlements)" = "RKS",
                    "Kosovo under UNSC res. 1244 (Roma, Ashkali, and Egyptian Communities)" = "RKS",
                    "Indonesia (Papua Selected Districts)" = "IDN",
                    "Indonesia (West Papua Selected Districts)" = "IDN",
                    "Lebanon (Palestinians)" = "LBN",
                    "Syrian Arab Republic (Palestinian Refugee Camps and Gatherings)" = "SYR",
                    "Syrian Arab Republic (Palestinian Refugee Camps and Gatherings)" = "SYR",
                    "Yugoslavia, The Federal Republic of (including current Serbia and Montenegro)" = "YUG",
                    "Sudan (South)" = "SSD")

catalogue$iso3 <- countrycode(catalogue$country, "country.name", "iso3c",
                        custom_match = custom_matches)

if(any(is.na(catalogue$iso3))) {
  stop("ISO3 missing for surveys: ",
       paste0(catalogue$country[is.na(catalogue$iso3)], collapse = ","))
}


## For subnational MICS, assign a custom location prefix different from the ISO3.
## Check that this does not conflict with any ISO3.

custom_loc_prefix <- c(
  "Bosnia and Herzegovina (Roma Settlements)" = "BIR",
  "Kosovo under UNSC res. 1244 (Roma settlements)" = "RKR",
  "Serbia (Roma Settlements)" = "SRR",
  "North Macedonia, Republic of (Roma Settlements)" = "MKR",
  "Montenegro (Roma Settlements)" = "MNR",
  "Kosovo under UNSC res. 1244 (Roma, Ashkali, and Egyptian Communities)" = "RKR",
  "Syrian Arab Republic (Palestinian Refugee Camps and Gatherings)" = "SYP",
  "Pakistan (Gilgit-Baltistan)" = "PAG",
  "Pakistan (Khyber Pakhtunkhwa)" = "PKK",
  "Pakistan (Khyber Pakhtunkhwa)" = "PKP",
  "Mongolia (Khuvsgul Aimag)" = "MNK",
  "Mongolia (Nalaikh District)" = "MNN",
  "Pakistan (Punjab)" = "PAP",
  "Pakistan (Sindh)" = "PAS",
  "Kenya (Bungoma County)" = "KEB",
  "Kenya (Kakamega County)" = "KEK",
  "Kenya (Turkana County)" = "KET",
  "Indonesia (Papua Selected Districts)" = "IDP",
  "Indonesia (West Papua Selected Districts)" = "IDW",
  "Somalia (Northeast Zone)" = "SON",
  "Somalia (Somaliland)" = "SOS",
  "Thailand (Bangkok Small Community)" = "THB"
)

iso3_clash <- intersect(custom_loc_prefix, countrycode::codelist$iso3c)

if(length(iso3_clash)) {
  stop("Custom location prefix clashes with ISO3 codes:",
       paste(iso3_clash, collapse = ", "))
}

catalogue$location_prefix <- catalogue$iso3
catalogue$location_prefix <- recode(catalogue$country, !!!custom_loc_prefix,
                              .default = catalogue$iso3)

duplicated_location_years <- duplicated(catalogue[c("location_prefix", "year")])

if(any(duplicated_location_years)) {
  stop("Duplicated location code and years in: ",
       paste(
         catalogue$location_prefix[duplicated_location_years],
         catalogue$year[duplicated_location_years],
         collapse = ", "
       )
       )
}

catalogue$survey_id <- paste0(catalogue$location_prefix, substr(catalogue$year, 1, 4), "MICS")


## Update orderly yaml. Must be done manually

raw_dir <- "mics_datasets_raw"
raw_paths <- file.path(raw_dir, catalogue$filename[is_available])

rds_dir <- "mics_datasets_rds"
rds_files <- paste0(tolower(catalogue$survey_id[is_available]), ".rds")
rds_paths <- file.path(rds_dir, rds_files)

## Temporarily drop files with non-ASCII name (CIV MICS5)
has_nonascii <- raw_paths %in% tools::showNonASCII(raw_paths)

raw_paths <- raw_paths[!has_nonascii]
rds_paths <- rds_paths[!has_nonascii]


yml <- yaml::read_yaml("orderly.yml")

yml$depends$download_mics_datasets$use <-
  as.list(c("depends/mics_survey_catalogue_filenames.csv" =
              "mics_survey_catalogue_filenames.csv",
            setNames(raw_paths, file.path("depends", raw_paths))))

yml$artefacts[[2]] <- list(data = list(description = "MICS datasets RDS",
                                       filenames = rds_paths))

yaml::write_yaml(yml, "orderly.yml")


## Reorder columns and save the catalogue
catalogue <- select(catalogue, -filename, -url, everything(), filename, url)

write.csv(catalogue, "mics_survey_catalogue.csv", row.names = FALSE, na = "")



## Most of the MICS datasets have a .txt file in them which is the README.
## Early surveys have a MS Word .doc.  For now, parse the .txt, but don't
## do anything to the .doc files. 
## 
## Check only one .txt in each file, which will assume is README.

num_txt_files <- raw_paths %>%
  file.path("depends", .) %>%
  lapply(unzip, list = TRUE) %>%
  lapply("[[", "Name") %>%
  lapply(grep, pattern = "\\.txt$") %>%
  lengths()
  
table(num_txt_files)
if(any(num_txt_files > 1))
  stop("MICS dataset has more than one .txt: ",
       paste(basename(raw_paths)[num_txt_files > 1], collapse = ", "))


## * Specify haven::read_sav(..., encoding = "latin1") to catch encoding errors

save_rds <- function(path_zip, rds_path) {

  print(basename(path_zip))

  ## extract contents and read in .savs
  tf <- tempfile()

  files <- unzip(file.path("depends", path_zip), exdir = tf)
  if(length(files) == 1 && grepl("\\.zip$", files))
    files <- unzip(files, exdir = tf)
  
  sav_files <- grep("\\.sav$", files, value = TRUE)
  file_type <- gsub("^(.*)\\.sav$", "\\1", basename(sav_files))

  ## parse these into a named list
  res <- lapply(sav_files, haven::read_sav, encoding = "latin1")
  names(res) <- file_type

  ## append readme if it exists
  readme_file <- grep("\\.txt$", files, value = TRUE, ignore.case = TRUE)
  if(length(readme_file)) {
    readme <- readLines(readme_file)
    res <- c(list(readme = readme), res)
  }

  saveRDS(res, rds_path)
}

dir.create(rds_dir)
res <- Map(save_rds, raw_paths, rds_paths)
