
## provided dataset from https://mics.unicef.org/surveys
csv <- read.csv("surveys_catalogue.csv", stringsAsFactors = FALSE)

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

csv$iso3 <- countrycode(csv$country, "country.name", "iso3c",
                        custom_match = custom_matches)

if(any(is.na(csv$iso3))) {
  stop("ISO3 missing for surveys: ",
       paste0(csv$country[is.na(csv$iso3)], collapse = ","))
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

csv$location_prefix <- csv$iso3
csv$location_prefix <- recode(csv$country, !!!custom_loc_prefix,
                              .default = csv$iso3)

duplicated_location_years <- duplicated(csv[c("location_prefix", "year")])

if(any(duplicated_location_years)) {
  stop("Duplicated location code and years in: ",
       paste(
         csv$location_prefix[duplicated_location_years],
         csv$year[duplicated_location_years],
         collapse = ", "
       )
       )
}

csv$survey_id <- paste0(csv$location_prefix, substr(csv$year, 1, 4), "MICS")



## indices of available datasets
is_available <- csv$datasets == "Available"

## generate candidate urls and file paths
stem <- "https://mics-surveys-prod.s3.amazonaws.com"
full <- mapply(FUN = file.path, stem, csv$round, csv$region, csv$country, csv$year, "Datasets",
               mapply(paste, csv$country, csv$round, "SPSS Datasets.zip"))
urls <- vapply(full, FUN = URLencode, FUN.VALUE = character(1))
csv$urls <- urls
csv$urls[!is_available] <- NA


## Download URLS do not follow a standardised format, so parse downloaded htmls
## identify download links.

html_files <- list.files("htmls", full.names = TRUE)
html_files <- html_files[file_ext(html_files) == "html"]


find_dataset_links <- function(x) {
  a_nodes <- rvest::html_nodes(xml2::read_html(x), "a")
  hrefs <- rvest::html_attr(a_nodes, "href")
  dataset_links <- grep("amazonaws.*Datasets", hrefs, value=TRUE)
}

links <- unlist(lapply(html_files, find_dataset_links))

if(length(links) != sum(is_available))
  stop("Number of dataset links does not match number of available datasets.\n",
       "These used to be aligned. Check your work")

## matching function
match_clean <- function(a, b, quiet=TRUE){
  a <- gsub("[[:punct:][:space:]]", "", tolower(stringi::stri_trans_general(a, "latin-ascii")))
  b <- gsub("[[:punct:][:space:]]", "", tolower(stringi::stri_trans_general(b, "latin-ascii")))
  ret <- match(a, b)
  if(sum(is.na(ret) > 0)){
    dists <- stringdist::seq_distmatrix(lapply(a, utf8ToInt), lapply(b, utf8ToInt))
    ret[is.na(ret)] <- apply(dists[which(is.na(ret)), , drop=FALSE], 1, which.min)
    if(!quiet){
      print(unique(cbind(a, b[ret])))
    }
  }
  return(ret)
}
csv$urls[is_available] <- links[match_clean(dirname(csv$urls[is_available]), dirname(links))]
csv$filename[is_available] <- vapply(basename(csv$urls[is_available]), URLdecode, character(1))

urls_tmp <- csv$urls
csv$urls <- NULL
csv$urls <- urls_tmp


## Save survey catalogue CSV with filenames
write.csv(csv, "mics_survey_catalogue_filenames.csv", row.names = FALSE, na = "")


## Identify datasets to download
save_dir <- "mics_datasets_raw"

urls <- csv$urls[is_available]
paths <- file.path(save_dir, csv$filename[is_available])

## update orderly.yml with all identified artefacts
yml <- yaml::read_yaml("orderly.yml")
yml$artefacts[[2]]$data$filenames <- paths
yaml::write_yaml(yml, "orderly.yml")

download_survey <- function(url, path) {
  print(basename(path))

  ## get the zip
  tf <- tempfile()
  resp <- httr::GET(url,
                    destfile = tf,
                    httr::write_disk(tf, overwrite = TRUE)
                    )
  
  code <- httr::status_code(resp)
  
  if ( !(code >= 400 && code < 600) ) {
    file.copy(tf, path)
  }

  return(code)
}

dir.create(save_dir)
surveys <- mapply(download_survey, urls, paths)
