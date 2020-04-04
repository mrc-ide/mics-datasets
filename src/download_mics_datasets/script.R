
# provided dataset from https://mics.unicef.org/surveys
csv <- read.csv("surveys_catalogue.csv")

# generate urls and file paths
stem <- "https://mics-surveys-prod.s3.amazonaws.com"
full <- mapply(FUN = file.path, stem, csv$round, csv$region, csv$country, csv$year, "Datasets",
               mapply(paste, csv$country, csv$round, "SPSS Datasets.zip"))
urls <- vapply(full, FUN = URLencode, FUN.VALUE = character(1))
csv$urls <- urls
csv$path <- paste0("mics_surveys/", csv$country, "_", csv$round, "_", csv$year, ".rds")

# subset to available
csv <- csv[which(csv$datasets == "Available"), ]

# annoyingly the urls are not quite accurate so use downloaded htmls (sadly)
fls <- list.files("htmls/", full.names = TRUE)
fls <- grep("html", fls, value = TRUE)
fls[1]

links <- unlist(lapply(fls, function(x){ 
  grep("Datasets",grep("amazon",rvest::html_attr(rvest::html_nodes(xml2::read_html(x),"a"),"href"),value=TRUE),value=TRUE)
}))

# matching function
match_clean <- function(a,b, quiet=TRUE){
  a <- gsub("[[:punct:][:space:]]","",tolower(stringi::stri_trans_general(a, "latin-ascii")))
  b <- gsub("[[:punct:][:space:]]","",tolower(stringi::stri_trans_general(b, "latin-ascii")))
  ret <- match(a,b)
  if(sum(is.na(ret)>0)){
    dists <- stringdist::seq_distmatrix(lapply(a,utf8ToInt),lapply(b,utf8ToInt))
    ret[is.na(ret)] <- apply(dists[which(is.na(ret)),,drop=FALSE],1,which.min)
    if(!quiet){
      print(unique(cbind(a,b[ret])))
    }
  }
  return(ret)
}

csv$urls <- links[match_clean(dirname(csv$urls), dirname(links))]

# update yml
yml <- yaml::read_yaml("orderly.yml")
yml$artefacts[[1]]$data$filenames <- csv$path
yaml::write_yaml(yml, "orderly.yml")

# fucntion to download mics
download_and_parse_survey <- function(url, path) {
  
  # get the zip
  tf <- tempfile()
  resp <- httr::GET(url,
                    destfile = tf,
                    httr::write_disk(tf, overwrite = TRUE),
                    httr::progress()
  )
  
  code <- httr::status_code(resp)
  if (code >= 400 && code < 600) {
   return(-1) 
  } else {
  
  # extract contents and read in .savs
  tf2 <- tempdir()
  zip_contents <- unzip(tf, exdir = tf2)
  files <- grep("sav", zip_contents, value = TRUE)
  file_type <- gsub("^(.*)\\.sav$", "\\1", basename(files))
  
  # parse these into a named list
  res <- lapply(files, function(x){
    
    res <- tryCatch(
      haven::read_spss(x),
      error=function(e) e
    )
    
    if(inherits(res, "error")){
      res <- foreign::read.spss(x)
    }
    return(res)
  })
    
  names(res) <- file_type
  
  # save to file
  saveRDS(res, path)
  }
}

# download surveys
dir.create("mics_surveys")
surveys <- mapply(download_and_parse_survey, csv$urls, csv$path)
