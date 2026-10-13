# MICS dataset repository

This is an [`orderly2`](https://github.com/vimc/orderly) project to maintain 
a repository of datasets from the [Multiple Indicator Cluster Surveys (MICS)](https://mics.unicef.org/).

The directories are:

* `src`: R scripts for tasks to download the datasets.
* `archive`: versioned results of running tasks.

## Summary of tasks

#### `save_raw_mics`

The task `save_raw_mics` saves the following artefacts:

* A folder `raw` containing the raw ZIP files of survey datasets 
  available from (https://mics.unicef.org/surveys).

The raw folder is excluded from GitHub. The files can be downloaded from the orderly2 Sharepoint remote.

#### `mics_rds`

The task `mics_rds` re-saves the MICS datasets as RDS files. It saves the
following artefacts:

* A CSV `mics_survey_catalogue.csv` with a list of all surveys and the assigned 
  location code and survey ID. The task assigns a `survey_id` to each survey 
  consisting of a three letter location code, survey year and suffix `MICS`. 
  For national surveys, the location code is the ISO3. For subnational surveys, 
  it is the first two letters of the ISO3 and a third letter, and checking that 
  it does not clash with assignd ISO3 codes.

* The folder `archive` contains an RDS file for each survey dataset. The 
  RDS file consists of a list of data frames for each of the datasets contained 
  in the raw zip. SPSS datasets are imported via `haven:read_sav()` and saved as `
  haven_labelled` variables. If the raw dataset contained a `.txt` Readme file, 
  this is also saved in the list via `readLines()`. Early MICS surveys contained
  MS Word (`.doc`) Readme files. These are not parsed.

This exists as a separate task from `save_raw_mics` so that errors or 
adjustments to the parsed RDS files can be fixed without re-downloading all raw
files.

The files can be downloaded from the orderly2 Sharepoint remote.

## Creating or updating the archive

Creating the archive requires the `orderly2` package:
```
install.packages("orderly")
```

2025 update: MICS datasets can now be bulk downloaded from the MICS website. 
This removes the previous requirement to manually update the surveys catalogue csv.

The csv is still required by the mics_rds script, and can be updated by download from https://mics.unicef.org/surveys

TODO: Add GIS datasets into this workflow