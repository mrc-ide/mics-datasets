orderly_strict_mode()
orderly_dependency("save_raw_mics", "latest", "raw/2025-10-30_mics_raw.zip")
orderly_resource("mics_surveys_catalogue.csv")

dir.create("artefacts")

unzip("raw/2025-10-30_mics_raw.zip", exdir = tempdir())

survs <- unzip("raw/2025-10-30_mics_raw.zip", list = T)

start <- survs$Name %>%
  str_replace("MICS6 Samoa Datasets.zip", "Samoa MICS6 Datasets.zip") %>%
  str_split(pattern = "MICS") %>%
  lapply(head, 1) %>%
  unlist() %>%
  str_remove_all("[0-9]") %>%
  str_replace_all("_", " ") %>%
  str_replace_all("-", " ") %>%
  str_replace("Honudras", "Honduras") %>%
  str_remove("Datasets.zip") %>%
  str_trim

custom_matches <- c("Eswatini" = "SWZ",
                    "Kosovo under UNSC res." = "RKS",
                    "Indonesia (Papua Selected Districts)" = "IDN",
                    "Indonesia (West Papua Selected Districts)" = "IDN",
                    "Lebanon (Palestinians)" = "LBN",
                    "Syrian Arab Republic (Palestinian Refugee Camps and Gatherings)" = "SYR",
                    "Syrian Arab Republic (Palestinian Refugee Camps and Gatherings)" = "SYR",
                    "Yugoslavia, The Federal Republic of (including current Serbia and Montenegro)" = "YUG",
                    "Sudan (South)" = "SSD")

subnational_matches <- c(
                    
                    ## For subnational MICS, assign a custom location prefix different from the ISO3.
                    ## Check that this does not conflict with any ISO3.
                    
                    "Bosnia and Herzegovina (Roma Settlements)" = "BIR",
                    "Serbia (Roma Settlements)" = "SRR",
                    "Republic of North Macedonia (Roma Settlements)" = "MKR",
                    "Macedonia (Roma Settlements)" = "MKR",
                    "Montenegro (Roma Settlements)" = "MNR",
                    "Kosovo (UNSCR ) (Roma, Ashkali and Egyptian Communities)"  = "RKR",
                    "Kosovo (UNSCR ) (Roma, Ashkali, and Egyptian Communities)"  = "RKR",
                    "Syrian Arab Republic (Palestinian Refugee Camps and Gatherings)" = "SYP",
                    "Egypt (Sub national)" = "EGS",
                    "Ghana (Accra)" = "GHS",
                    "Madagascar (South)" = "MDS",
                    "Pakistan (Balochistan)" = "PAB",
                    "Pakistan (Gilgit-Baltistan)" = "PAG",
                    "Pakistan (Khyber Pakhtunkhwa)" = "PAP",
                    "Pakistan Khyber Pakhtunkhwa" = "PAP",
                    "Pakistan (Punjab)" = "PAB",
                    "Pakistan (Sindh)" = "PAS",
                    "Pakistan Punjab" = "PAB",
                    "Pakistan Sindh" = "PAS",
                    "Mongolia (Khuvsgul Aimag)" = "MNK",
                    "Mongolia (Nalaikh District)" = "MNN",
                    "Pakistan (Punjab)" = "PAP",
                    "Nepal (Mid and Far Western Regions)" = "NPM",
                    "Pakistan (Sindh)" = "PAS",
                    "Kenya (Bungoma County)" = "KEB",
                    "Kenya (Kakamega County)" = "KEK",
                    "Kenya (Turkana County)" = "KET",
                    "Kenya (Nyanza Province)" = "KEP",
                    "Kenya (Mombasa Informal Settlements)" = "KEM",
                    "Indonesia (Selected Districts of Papua)" = "IDP",
                    "Indonesia (Selected Districts of West Papua)" = "IDW",
                    "Somalia (Northeast Zone)" = "SON",
                    "Somalia (Somaliland)" = "SOS",
                    "Senegal (Dakar)" = "SED",
                    "Thailand (Bangkok Small Community)" = "THB",
                    "Thailand Bangkok" = "THB"
                    
                    )

iso3_clash <- intersect(subnational_matches, countrycode::codelist$iso3c)

if(length(iso3_clash)) {
  stop("Custom location prefix clashes with ISO3 codes:",
       paste(iso3_clash, collapse = ", "))
}

surv_df <- survs %>%
  select(Name) %>%
  mutate(clean_name = start,
         iso3 = countrycode::countrycode(start, "country.name", "iso3c", custom_match = c(custom_matches,
                                                                                          "Indonesia (Selected Districts of Papua)" = "IDN",
                                                                                          "Indonesia (Selected Districts of West Papua)" = "IDN",
                                                                                          "Kosovo (UNSCR ) (Roma, Ashkali and Egyptian Communities)" = "RKS",
                                                                                          "Kosovo (UNSCR ) (Roma, Ashkali, and Egyptian Communities)" = "RKS"
                                                                                          )),
         iso3_all = countrycode::countrycode(start, "country.name", "iso3c", custom_match = c(custom_matches, subnational_matches)),
         year = str_extract(survs$Name, "[0-9]{4}"),
         year = ifelse(year == 1244, NA, year),
         round = str_extract(survs$Name, "MICS[0-9]"))

correct_nesting <- surv_df %>%
  mutate(first_iso = str_sub(iso3, 1, 2),
         first_iso_all = str_sub(iso3_all, 1, 2)) %>%
  filter(first_iso != first_iso_all) %>%
  select(clean_name, first_iso, first_iso_all)

if(nrow(correct_nesting)) {
  stop("Custom location prefix doesn't share first 2 letters of parent country:",
       paste(correct_nesting, collapse = ", "))
}

if(nrow(filter(surv_df, is.na(iso3)))) {
  stop("Missing iso3",
       paste(filter(surv_df, is.na(iso3)) %>% select(clean_name, iso3), collapse = ", "))
}

survey_catalogue <- read_csv("mics_surveys_catalogue.csv", show_col_types = F) %>%
  filter(`mics datasets` == "Available") %>%
  mutate(iso3 = countrycode::countrycode(country, "country.name", "iso3c", custom_match = c("Kosovo (UNSC 1244)" = "RKS")))

#' TODO:
#' This drops the ~30 surveys that have no year information and have >1 survey in 1 MICS round in 1 country. 
#' Only Nyanza (MICS4) is impacted from SSA
#' But if there's ever any need for Thailand, Pakistan, Tunisia, Mongolia, Lao - THIS NEEDS FIXING BY HAND
surv_round_year <- surv_df %>%
  filter(is.na(year)) %>%
  select(-year) %>%
  mutate(idx = row_number()) %>%
  left_join(survey_catalogue %>% select(round, year, iso3) %>% distinct()) %>%
  group_by(idx) %>%
  filter(n() == 1) %>%
  ungroup() %>%
  mutate(year = str_sub(year, 1,4)) %>%
  type.convert(as.is = T)

surv_df <- surv_df %>%
  filter(!is.na(year)) %>%
  type.convert(as.is = T) %>%
  bind_rows(surv_round_year)

surv_df <- surv_df %>%
  mutate(year = ifelse(Name == "Kosovo (UNSCR 1244) (Roma, Ashkali, and Egyptian Communities) 2013-14 MICS_Datasets.zip", 2013, year))

if(nrow(filter(surv_df, is.na(year)))) {
  stop("Missing year")
}

clean_survey_df <- surv_df %>%
  mutate(survey_id = paste0(iso3_all, year, "MICS"))

if(nrow(clean_survey_df %>%
        group_by(survey_id) %>%
        filter(n() > 1))) {
  stop("Duplicated survey IDs")
}


num_txt_files <- file.path(tempdir(), clean_survey_df$Name) %>%
  lapply(unzip, list = T) %>%
  lapply("[[", "Name") %>%
  lapply(grep, pattern = "\\.txt$") %>%
  lengths()

table(num_txt_files)
if(any(num_txt_files > 1))
  stop("MICS dataset has more than one .txt: ",
       paste(survs$Name[num_txt_files > 1], collapse = ", "))


save_rds <- function(path_zip, rds_path) {
  
  print(basename(path_zip))
  
  ## extract contents and read in .savs
  tf <- tempfile()
  
  files <- unzip(path_zip, exdir = tf)
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

## Temporarily drop files with non-ASCII name (CIV MICS5)
raw_paths <- file.path(tempdir(), clean_survey_df$Name)
has_nonascii <- raw_paths %in% tools::showNonASCII(raw_paths)

rds_paths <- file.path("artefacts", paste0(clean_survey_df$survey_id, ".rds"))

raw_paths <- raw_paths[!has_nonascii]
rds_paths <- rds_paths[!has_nonascii]

orderly_artefact(files = rds_paths)

res <- Map(save_rds, raw_paths, rds_paths)
