
## provided dataset from https://mics.unicef.org/surveys
csv <- read.csv("surveys_catalogue.csv", stringsAsFactors = FALSE)

## indices of available datasets
is_available <- csv$datasets == "Available"

#' ## 2021-07-07:
#'
#' The MICS website has been updated and the URL code below no longer works.
#' The file survey_catalogue.csv was manually updated with the URLs.
#' 

## ## generate candidate urls and file paths
## stem <- "https://mics-surveys-prod.s3.amazonaws.com"
## full <- mapply(FUN = file.path, stem, csv$round, csv$region, csv$country, csv$year, "Datasets",
##                mapply(paste, csv$country, csv$round, "SPSS Datasets.zip"))
## urls <- vapply(full, FUN = URLencode, FUN.VALUE = character(1))
## csv$url <- urls
## csv$url[!is_available] <- NA


## ## Download URLS do not follow a standardised format, so parse downloaded htmls
## ## identify download URLs.

## html_files <- list.files("htmls", full.names = TRUE)
## html_files <- html_files[file_ext(html_files) == "html"]


## find_dataset_urls <- function(x) {
##   a_nodes <- rvest::html_nodes(xml2::read_html(x), "a")
##   hrefs <- rvest::html_attr(a_nodes, "href")
##   dataset_urls <- grep("amazonaws.*Datasets", hrefs, value=TRUE)
## }

## urls <- unlist(lapply(html_files, find_dataset_urls))

## if(length(urls) != sum(is_available))
##   stop("Number of dataset URLs does not match number of available datasets.\n",
##        "These used to be aligned. Check your work")

## ## matching function
## match_clean <- function(a, b, quiet=TRUE){
##   a <- gsub("[[:punct:][:space:]]", "", tolower(stringi::stri_trans_general(a, "latin-ascii")))
##   b <- gsub("[[:punct:][:space:]]", "", tolower(stringi::stri_trans_general(b, "latin-ascii")))
##   ret <- match(a, b)
##   if(sum(is.na(ret) > 0)){
##     dists <- stringdist::seq_distmatrix(lapply(a, utf8ToInt), lapply(b, utf8ToInt))
##     ret[is.na(ret)] <- apply(dists[which(is.na(ret)), , drop=FALSE], 1, which.min)
##     if(!quiet){
##       print(unique(cbind(a, b[ret])))
##     }
##   }
##   return(ret)
## }
## csv$url[is_available] <- urls[match_clean(dirname(csv$url[is_available]), dirname(urls))]
## csv$filename[is_available] <- vapply(basename(csv$url[is_available]), URLdecode, character(1))

## ## Move URL to last column
## url_tmp <- csv$url
## csv$url <- NULL
## csv$url <- url_tmp


## Save survey catalogue CSV with filenames
write.csv(csv, "mics_survey_catalogue_filenames.csv", row.names = FALSE, na = "")


## Identify datasets to download
save_dir <- "mics_datasets_raw"

urls <- csv$url[is_available]
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
