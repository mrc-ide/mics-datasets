orderly::orderly_strict_mode()

orderly::orderly_description(
  display = "Save MICS datasets as RDS",
  long = "This task (1) assigns a survey ID to every MICS survey, and (2) saves each of\nthe raw SPSS formatted datasets as an RDS file. The datasets are parsed using\nhaven:read_sav(). All datasets from a single survey are saved as a list in the\nRDS. If the survey has a README .txt included, these are saved as a character\nvector in the list. Early MICS surveys disseminated the README as a MS Word\n.doc file. These are not parsed yet.\n")

orderly::orderly_dependency(
  "download_mics_datasets",
  "latest",
  c("depends/mics_survey_catalogue_filenames.csv" = "mics_survey_catalogue_filenames.csv",
    "depends/mics_datasets_raw/Argentina MICS6 Datasets.zip" = "mics_datasets_raw/Argentina MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Guyana MICS6 Datasets.zip" = "mics_datasets_raw/Guyana MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Kosovo (UNSCR 1244) MICS6 Datasets.zip" = "mics_datasets_raw/Kosovo (UNSCR 1244) MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Kosovo (UNSCR 1244) (Roma, Ashkali and Egyptian Communities) MICS6 Datasets.zip" = "mics_datasets_raw/Kosovo (UNSCR 1244) (Roma, Ashkali and Egyptian Communities) MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Malawi MICS6 SPSS.zip" = "mics_datasets_raw/Malawi MICS6 SPSS.zip",
    "depends/mics_datasets_raw/MICS6 Samoa Datasets.zip" = "mics_datasets_raw/MICS6 Samoa Datasets.zip",
    "depends/mics_datasets_raw/State of Palestine MICS6 Datasets.zip" = "mics_datasets_raw/State of Palestine MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Turks and Caicos Islands MICS6 Datasets.zip" = "mics_datasets_raw/Turks and Caicos Islands MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Tuvalu MICS6 Datasets.zip" = "mics_datasets_raw/Tuvalu MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Bangladesh MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Bangladesh MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Belarus MICS6 Datasets.zip" = "mics_datasets_raw/Belarus MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Chad MICS6 Datasets.zip" = "mics_datasets_raw/Chad MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Cuba MICS6 Datasets.zip" = "mics_datasets_raw/Cuba MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Dominican Republic MICS6 Datasets.zip" = "mics_datasets_raw/Dominican Republic MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Honduras MICS6 Datasets.zip" = "mics_datasets_raw/Honduras MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Nepal MICS6 Datasets.zip" = "mics_datasets_raw/Nepal MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Sao Tome and Principe MICS6 Datasets.zip" = "mics_datasets_raw/Sao Tome and Principe MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Serbia MICS6 Datasets.zip" = "mics_datasets_raw/Serbia MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Serbia (Roma Settlements) MICS6 Datasets.zip" = "mics_datasets_raw/Serbia (Roma Settlements) MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Thailand MICS6 Datasets.zip" = "mics_datasets_raw/Thailand MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Tonga MICS6 Datasets.zip" = "mics_datasets_raw/Tonga MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Turkmenistan MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Turkmenistan MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Zimbabwe MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Zimbabwe MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Algeria MICS6 Datasets.zip" = "mics_datasets_raw/Algeria MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Central African Republic MICS6 Datasets.zip" = "mics_datasets_raw/Central African Republic MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Guinea Bissau MICS6 Datasets.zip" = "mics_datasets_raw/Guinea Bissau MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Kiribati MICS6 Datasets.zip" = "mics_datasets_raw/Kiribati MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Republic of North Macedonia MICS6 Datasets.zip" = "mics_datasets_raw/Republic of North Macedonia MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Republic of North Macedonia (Roma Settlements) MICS6 Datasets.zip" = "mics_datasets_raw/Republic of North Macedonia (Roma Settlements) MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Pakistan Sindh MICS6 Datasets.zip" = "mics_datasets_raw/Pakistan Sindh MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Costa Rica MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Costa Rica MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/The-Gambia-MICS6-Datasets.zip" = "mics_datasets_raw/The-Gambia-MICS6-Datasets.zip",
    "depends/mics_datasets_raw/Georgia MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Georgia MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Iraq MICS6 Datasets.zip" = "mics_datasets_raw/Iraq MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Kyrgyz Republic MICS6 Datasets.zip" = "mics_datasets_raw/Kyrgyz Republic MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Lesotho_MICS6_datasets.zip" = "mics_datasets_raw/Lesotho_MICS6_datasets.zip",
    "depends/mics_datasets_raw/Madagascar MICS6 SPSS dataset.zip" = "mics_datasets_raw/Madagascar MICS6 SPSS dataset.zip",
    "depends/mics_datasets_raw/Mongolia MICS 2018 SPSS Datasets.zip" = "mics_datasets_raw/Mongolia MICS 2018 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Montenegro MICS6 Datasets.zip" = "mics_datasets_raw/Montenegro MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Montenegro (Roma Settlements) MICS6 Datasets.zip" = "mics_datasets_raw/Montenegro (Roma Settlements) MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Suriname MICS6 SPSS Datafiles.zip" = "mics_datasets_raw/Suriname MICS6 SPSS Datafiles.zip",
    "depends/mics_datasets_raw/Tunisia MICS6 Datasets.zip" = "mics_datasets_raw/Tunisia MICS6 Datasets.zip",
    "depends/mics_datasets_raw/DRCongo MICS6 SPSS Datafiles.zip" = "mics_datasets_raw/DRCongo MICS6 SPSS Datafiles.zip",
    "depends/mics_datasets_raw/Ghana MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Ghana MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Pakistan Punjab MICS6 Datasets.zip" = "mics_datasets_raw/Pakistan Punjab MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Lao PDR MICS6 Datasets.zip" = "mics_datasets_raw/Lao PDR MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Sierra Leone MICS6 Datasets.zip" = "mics_datasets_raw/Sierra Leone MICS6 Datasets.zip",
    "depends/mics_datasets_raw/Togo MICS6 SPSS Datasets.zip" = "mics_datasets_raw/Togo MICS6 SPSS Datasets.zip",
    "depends/mics_datasets_raw/Nigeria MICS5 Datasets.zip" = "mics_datasets_raw/Nigeria MICS5 Datasets.zip",
    "depends/mics_datasets_raw/Pakistan (Gilgit Baltistan)_MICS5_Datasets.zip" = "mics_datasets_raw/Pakistan (Gilgit Baltistan)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Pakistan_(Khyber_Pakhtunkhwa)_MICS5_Datasets.zip" = "mics_datasets_raw/Pakistan_(Khyber_Pakhtunkhwa)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Guinea_MICS5_Datasets.zip" = "mics_datasets_raw/Guinea_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia (Khuvsgul Aimag)_MICS5_Datasets.zip" = "mics_datasets_raw/Mongolia (Khuvsgul Aimag)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia (Nalaikh District)_MICS5_Datasets.zip" = "mics_datasets_raw/Mongolia (Nalaikh District)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Paraguay_MICS5_Datasets.zip" = "mics_datasets_raw/Paraguay_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Thailand_14_Provinces_MICS5_Datasets.zip" = "mics_datasets_raw/Thailand_14_Provinces_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Belize_MICS5_Datasets.zip" = "mics_datasets_raw/Belize_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Senegal (Dakar)_MICS5_Datasets.zip" = "mics_datasets_raw/Senegal (Dakar)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Thailand_MICS5_Datasets.zip" = "mics_datasets_raw/Thailand_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Thailand Bangkok_MICS5_Datasets.zip" = "mics_datasets_raw/Thailand Bangkok_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Turkmenistan_MICS5_Datasets.zip" = "mics_datasets_raw/Turkmenistan_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Kazakhstan_MICS5_Datasets.zip" = "mics_datasets_raw/Kazakhstan_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Mali_MICS5_Datasets.zip" = "mics_datasets_raw/Mali_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Mauritania_MICS5_Datasets.zip" = "mics_datasets_raw/Mauritania_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Mexico_MICS5_Datasets.zip" = "mics_datasets_raw/Mexico_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Congo_MICS5_Datasets.zip" = "mics_datasets_raw/Congo_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Benin_MICS5_Datasets.zip" = "mics_datasets_raw/Benin_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Cameroon_MICS5_Datasets.zip" = "mics_datasets_raw/Cameroon_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Cuba 2014 MICS_Datasets.zip" = "mics_datasets_raw/Cuba 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Dominican Republic_MICS5_Datasets.zip" = "mics_datasets_raw/Dominican Republic_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/El Salvador_MICS5_Datasets.zip" = "mics_datasets_raw/El Salvador_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Swaziland_MICS5_Datasets.zip" = "mics_datasets_raw/Swaziland_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Guinea Bissau_MICS5_Datasets.zip" = "mics_datasets_raw/Guinea Bissau_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Guyana_MICS 2014_Datasets.zip" = "mics_datasets_raw/Guyana_MICS 2014_Datasets.zip",
    "depends/mics_datasets_raw/Kyrgyzstan 2014 MICS_Datasets.zip" = "mics_datasets_raw/Kyrgyzstan 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Nepal 2014 MICS_Datasets.zip" = "mics_datasets_raw/Nepal 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Pakistan (Punjab)_MICS5_Datasets.zip" = "mics_datasets_raw/Pakistan (Punjab)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Pakistan (Sindh)_MICS5_Datasets.zip" = "mics_datasets_raw/Pakistan (Sindh)_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Sao Tome and Principe 2014 MICS_Datasets.zip" = "mics_datasets_raw/Sao Tome and Principe 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Serbia 2014 MICS_Datasets.zip" = "mics_datasets_raw/Serbia 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Serbia (Roma Settlements) 2014 MICS_Datasets.zip" = "mics_datasets_raw/Serbia (Roma Settlements) 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/State of Palestine 2014 MICS_Datasets.zip" = "mics_datasets_raw/State of Palestine 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sudan_MICS5_Datasets.zip" = "mics_datasets_raw/Sudan_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Zimbabwe 2014 MICS_Datasets.zip" = "mics_datasets_raw/Zimbabwe 2014 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Egypt (Sub-national) 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Egypt (Sub-national) 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kenya (Bungoma County) 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Kenya (Bungoma County) 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kenya (Kakamega County) 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Kenya (Kakamega County) 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kenya (Turkana County) 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Kenya (Turkana County) 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kosovo (UNSCR 1244) 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Kosovo (UNSCR 1244) 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kosovo (UNSCR 1244) (Roma, Ashkali, and Egyptian Communities) 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Kosovo (UNSCR 1244) (Roma, Ashkali, and Egyptian Communities) 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Malawi 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Malawi 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia_MICS5_Datasets.zip" = "mics_datasets_raw/Mongolia_MICS5_Datasets.zip",
    "depends/mics_datasets_raw/Viet Nam 2013-14 MICS_Datasets.zip" = "mics_datasets_raw/Viet Nam 2013-14 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Montenegro 2013 MICS_Datasets.zip" = "mics_datasets_raw/Montenegro 2013 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Montenegro (Roma Settlements) 2013 MICS_Datasets.zip" = "mics_datasets_raw/Montenegro (Roma Settlements) 2013 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Panama 2013 MICS_Datasets.zip" = "mics_datasets_raw/Panama 2013 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Algeria_MICS4_Datasets.zip" = "mics_datasets_raw/Algeria_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Bangladesh 2012-13 MICS_Datasets.zip" = "mics_datasets_raw/Bangladesh 2012-13 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Thailand_MICS4_Datasets.zip" = "mics_datasets_raw/Thailand_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Uruguay 2012-13_Datasets.zip" = "mics_datasets_raw/Uruguay 2012-13_Datasets.zip",
    "depends/mics_datasets_raw/Barbados 2012 MICS_Datasets.zip" = "mics_datasets_raw/Barbados 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Belarus 2012 MICS_Datasets.zip" = "mics_datasets_raw/Belarus 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Madagascar (South) 2012 MICS_Datasets.zip" = "mics_datasets_raw/Madagascar (South) 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Moldova 2012 MICS_Datasets.zip" = "mics_datasets_raw/Moldova 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia (Khuvsgul Aimag) 2012 MICS_Datasets.zip" = "mics_datasets_raw/Mongolia (Khuvsgul Aimag) 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia (Nalaikh District)_MICS4_Datasets.zip" = "mics_datasets_raw/Mongolia (Nalaikh District)_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Qatar_MICS4_Datasets.zip" = "mics_datasets_raw/Qatar_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Saint Lucia 2012 MICS_Datasets.zip" = "mics_datasets_raw/Saint Lucia 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Ukraine 2012 MICS_Datasets.zip" = "mics_datasets_raw/Ukraine 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Argentina 2012 MICS_Datasets.zip" = "mics_datasets_raw/Argentina 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Bosnia and Herzegovina 2012 MICS _Datasets.zip" = "mics_datasets_raw/Bosnia and Herzegovina 2012 MICS _Datasets.zip",
    "depends/mics_datasets_raw/Bosnia and Herzegovina (Roma Settlements) 2012 MICS_Datasets.zip" = "mics_datasets_raw/Bosnia and Herzegovina (Roma Settlements) 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Lao 2012 MICS_Datasets.zip" = "mics_datasets_raw/Lao 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Tunisia 2012 MICS_Datasets.zip" = "mics_datasets_raw/Tunisia 2012 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Belize 2011 MICS_Datasets.zip" = "mics_datasets_raw/Belize 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Costa Rica 2011 MICS_Datasets.zip" = "mics_datasets_raw/Costa Rica 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Ghana 2011 MICS_Datasets.zip" = "mics_datasets_raw/Ghana 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Indonesia (Selected Districts of Papua) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Indonesia (Selected Districts of Papua) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Indonesia (Selected Districts of West Papua) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Indonesia (Selected Districts of West Papua) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Iraq 2011 MICS_Datasets.zip" = "mics_datasets_raw/Iraq 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Jamaica 2011 MICS_Datasets.zip" = "mics_datasets_raw/Jamaica 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kenya (Nyanza Province)_MICS4_Datasets.zip" = "mics_datasets_raw/Kenya (Nyanza Province)_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Lebanon (Palestinians) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Lebanon (Palestinians) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mauritania_MICS4_Datasets.zip" = "mics_datasets_raw/Mauritania_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Nigeria 2011 MICS_Datasets.zip" = "mics_datasets_raw/Nigeria 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Macedonia 2011 MICS_Datasets.zip" = "mics_datasets_raw/Macedonia 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Macedonia (Roma Settlements) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Macedonia (Roma Settlements) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Pakistan (Punjab) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Pakistan (Punjab) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Somalia (Northeast Zone) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Somalia (Northeast Zone) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Somalia (Somaliland) 2011 MICS_Datasets.zip" = "mics_datasets_raw/Somalia (Somaliland) 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Trinidad and Tobago_MICS4_Datasets.zip" = "mics_datasets_raw/Trinidad and Tobago_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Afghanistan 2011 MICS_Datasets.zip" = "mics_datasets_raw/Afghanistan 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Cuba 2011 MICS_Datasets.zip" = "mics_datasets_raw/Cuba 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Ghana (Accra) 2010-11 MICS_Datasets.zip" = "mics_datasets_raw/Ghana (Accra) 2010-11 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kazakhstan 2010-11 MICS_Datasets.zip" = "mics_datasets_raw/Kazakhstan 2010-11 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Viet Nam 2011 MICS_Datasets.zip" = "mics_datasets_raw/Viet Nam 2011 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Bhutan 2010 MICS_Datasets.zip" = "mics_datasets_raw/Bhutan 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Central African Republic 2010 MICS_Datasets.zip" = "mics_datasets_raw/Central African Republic 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Chad 2010 MICS_Datasets.zip" = "mics_datasets_raw/Chad 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Congo DR 2010 MICS_Datasets.zip" = "mics_datasets_raw/Congo DR 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Swaziland 2010 MICS_Datasets.zip" = "mics_datasets_raw/Swaziland 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/The Gambia_MICS4_Datasets.zip" = "mics_datasets_raw/The Gambia_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Guinea Bissau_MICS4_Datasets.zip" = "mics_datasets_raw/Guinea Bissau_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia 2010 MICS_Datasets.zip" = "mics_datasets_raw/Mongolia 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Nepal (Mid and Far Western Regions) 2010 MICS_Datasets.zip" = "mics_datasets_raw/Nepal (Mid and Far Western Regions) 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Pakistan (Balochistan) 2010 MICS_Datasets.zip" = "mics_datasets_raw/Pakistan (Balochistan) 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Serbia 2010 MICS_Datasets.zip" = "mics_datasets_raw/Serbia 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Serbia (Roma Settlements) 2010 MICS_Datasets.zip" = "mics_datasets_raw/Serbia (Roma Settlements) 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sierra Leone 2010 MICS_Datasets.zip" = "mics_datasets_raw/Sierra Leone 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/South Sudan 2010 MICS_Datasets.zip" = "mics_datasets_raw/South Sudan 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/State of Palestine 2010 MICS_Datasets.zip" = "mics_datasets_raw/State of Palestine 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sudan_2010_MICS4_Datasets.zip" = "mics_datasets_raw/Sudan_2010_MICS4_Datasets.zip",
    "depends/mics_datasets_raw/Suriname 2010 MICS_Datasets.zip" = "mics_datasets_raw/Suriname 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Togo 2010 MICS_Datasets.zip" = "mics_datasets_raw/Togo 2010 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mali 2009-10 MICS4 Datasets.zip" = "mics_datasets_raw/Mali 2009-10 MICS4 Datasets.zip",
    "depends/mics_datasets_raw/Kenya (Mombasa Informal Settlements) 2009 MICS_Datasets.zip" = "mics_datasets_raw/Kenya (Mombasa Informal Settlements) 2009 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Zimbabwe 2009 MICS_Datasets.zip" = "mics_datasets_raw/Zimbabwe 2009 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mozambique 2008 MICS_Datasets.zip" = "mics_datasets_raw/Mozambique 2008 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Vanuatu 2007 MICS_Datasets.zip" = "mics_datasets_raw/Vanuatu 2007 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mauritania 2007 MICS_Datasets.zip" = "mics_datasets_raw/Mauritania 2007 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Nigeria 2007 MICS_Datasets.zip" = "mics_datasets_raw/Nigeria 2007 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Guyana 2006-07 MICS_Datasets.zip" = "mics_datasets_raw/Guyana 2006-07 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Bangladesh 2006 MICS_Datasets.zip" = "mics_datasets_raw/Bangladesh 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Belize 2006 MICS_Datasets.zip" = "mics_datasets_raw/Belize 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Bosnia and Herzegovina 2006 MICS_Datasets.zip" = "mics_datasets_raw/Bosnia and Herzegovina 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Burkina Faso 2006 MICS_Datasets.zip" = "mics_datasets_raw/Burkina Faso 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Cameroon 2006 MICS_Datasets.zip" = "mics_datasets_raw/Cameroon 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Central African Republic 2006 MICS_Datasets.zip" = "mics_datasets_raw/Central African Republic 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Cuba 2006 MICS_Datasets.zip" = "mics_datasets_raw/Cuba 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Cote d'Ivoire 2006 MICS_Datasets.zip" = "mics_datasets_raw/Cote d'Ivoire 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Djibouti 2006 MICS_Datasets.zip" = "mics_datasets_raw/Djibouti 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Ghana 2006 MICS_Datasets.zip" = "mics_datasets_raw/Ghana 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Guinea-Bissau 2006 MICS_Datasets.zip" = "mics_datasets_raw/Guinea-Bissau 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Iraq 2006 MICS_Datasets.zip" = "mics_datasets_raw/Iraq 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kazakhstan 2006 MICS_Datasets.zip" = "mics_datasets_raw/Kazakhstan 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Lao PDR 2006 MICS_Datasets.zip" = "mics_datasets_raw/Lao PDR 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Malawi 2006 MICS_Datasets.zip" = "mics_datasets_raw/Malawi 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Somalia 2006 MICS_Datasets.zip" = "mics_datasets_raw/Somalia 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Suriname 2006 MICS_Datasets.zip" = "mics_datasets_raw/Suriname 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Syrian Arab Republic 2006 MICS_Datasets.zip" = "mics_datasets_raw/Syrian Arab Republic 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Togo 2006 MICS_Datasets.zip" = "mics_datasets_raw/Togo 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Trinidad and Tobago 2006 MICS_Datasets.zip" = "mics_datasets_raw/Trinidad and Tobago 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Turkmenistan 2006 MICS_Datasets.zip" = "mics_datasets_raw/Turkmenistan 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Uzbekistan 2006 MICS_Datasets.zip" = "mics_datasets_raw/Uzbekistan 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Viet Nam 2006 MICS_Datasets.zip" = "mics_datasets_raw/Viet Nam 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Yemen 2006 MICS_Datasets.zip" = "mics_datasets_raw/Yemen 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Gambia 2005-06 MICS_Datasets.zip" = "mics_datasets_raw/Gambia 2005-06 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kyrgyzstan 2005-06 MICS_Datasets.zip" = "mics_datasets_raw/Kyrgyzstan 2005-06 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Lebanon (Palestinians) 2006 MICS_Datasets.zip" = "mics_datasets_raw/Lebanon (Palestinians) 2006 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Montenegro 2005-06 MICS_Datasets.zip" = "mics_datasets_raw/Montenegro 2005-06 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Macedonia 2005-06 MICS_Datasets.zip" = "mics_datasets_raw/Macedonia 2005-06 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Serbia 2005-06 MICS_Datasets.zip" = "mics_datasets_raw/Serbia 2005-06 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sierra Leone 2005 MICS_Datasets.zip" = "mics_datasets_raw/Sierra Leone 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Thailand 2005-06 MICS_Datasets.zip" = "mics_datasets_raw/Thailand 2005-06 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Albania 2005 MICS_Datasets.zip" = "mics_datasets_raw/Albania 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Belarus 2005 MICS_Datasets.zip" = "mics_datasets_raw/Belarus 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Burundi 2005 MICS_Datasets.zip" = "mics_datasets_raw/Burundi 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Georgia 2005 MICS_Datasets.zip" = "mics_datasets_raw/Georgia 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Jamaica 2005 MICS_Datasets.zip" = "mics_datasets_raw/Jamaica 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia 2005 MICS_Datasets.zip" = "mics_datasets_raw/Mongolia 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Tajikistan 2005 MICS_Datasets.zip" = "mics_datasets_raw/Tajikistan 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Ukraine 2005 MICS_Datasets.zip" = "mics_datasets_raw/Ukraine 2005 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Angola 2001 MICS_Datasets.zip" = "mics_datasets_raw/Angola 2001 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Congo, Democratic Republic of 2001 MICS_Datasets.zip" = "mics_datasets_raw/Congo, Democratic Republic of 2001 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Albania 2000 MICS_Datasets.zip" = "mics_datasets_raw/Albania 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Azerbaijan 2000 MICS_Datasets.zip" = "mics_datasets_raw/Azerbaijan 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Bolivia 2000 MICS_Datasets.zip" = "mics_datasets_raw/Bolivia 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Bosnia and Herzegovina 2000 MICS_Datasets.zip" = "mics_datasets_raw/Bosnia and Herzegovina 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Botswana 2000 MICS_Datasets.zip" = "mics_datasets_raw/Botswana 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Burundi 2000 MICS_Datasets.zip" = "mics_datasets_raw/Burundi 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Cameroon 2000 MICS_Datasets.zip" = "mics_datasets_raw/Cameroon 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Central African Republic 2000 MICS_Datasets.zip" = "mics_datasets_raw/Central African Republic 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Chad 2000 MICS_Datasets.zip" = "mics_datasets_raw/Chad 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Comoros 2000 MICS_Datasets.zip" = "mics_datasets_raw/Comoros 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Cote d'Ivoire 2000 MICS_Datasets.zip" = "mics_datasets_raw/Cote d'Ivoire 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Dominican Republic 2000 MICS_Datasets.zip" = "mics_datasets_raw/Dominican Republic 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Equatorial Guinea 2000 MICS_Datasets.zip" = "mics_datasets_raw/Equatorial Guinea 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Swaziland 2000 MICS_Datasets.zip" = "mics_datasets_raw/Swaziland 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Gambia 2000 MICS_Datasets.zip" = "mics_datasets_raw/Gambia 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Guinea Bissau 2000 MICS_Datasets.zip" = "mics_datasets_raw/Guinea Bissau 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Guyana 2000 MICS_Datasets.zip" = "mics_datasets_raw/Guyana 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Indonesia MICS2 2000_Datasets.zip" = "mics_datasets_raw/Indonesia MICS2 2000_Datasets.zip",
    "depends/mics_datasets_raw/Iraq 2000 MICS_Datasets.zip" = "mics_datasets_raw/Iraq 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Kenya 2000 MICS_Datasets.zip" = "mics_datasets_raw/Kenya 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Lao PDR 2000 MICS_Datasets.zip" = "mics_datasets_raw/Lao PDR 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Lesotho 2000 MICS_Datasets.zip" = "mics_datasets_raw/Lesotho 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Madagascar 2000 MICS_Datasets.zip" = "mics_datasets_raw/Madagascar 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Moldova 2000 MICS_Datasets.zip" = "mics_datasets_raw/Moldova 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Mongolia 2000 MICS_Datasets.zip" = "mics_datasets_raw/Mongolia 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Myanmar 2000 MICS_Datasets.zip" = "mics_datasets_raw/Myanmar 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Niger 2000 MICS_Datasets.zip" = "mics_datasets_raw/Niger 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Rwanda 2000 MICS_Datasets.zip" = "mics_datasets_raw/Rwanda 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sao Tome and Principle 2000 MICS_Datasets.zip" = "mics_datasets_raw/Sao Tome and Principle 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Senegal 2000 MICS_Datasets.zip" = "mics_datasets_raw/Senegal 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sierra Leone 2000 MICS_Datasets.zip" = "mics_datasets_raw/Sierra Leone 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Sudan 2000 MICS_Datasets.zip" = "mics_datasets_raw/Sudan 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Tajikistan 2000 MICS_Datasets.zip" = "mics_datasets_raw/Tajikistan 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Togo 2000 MICS_Datasets.zip" = "mics_datasets_raw/Togo 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Trinidad and Tobago 2000 MICS_Datasets.zip" = "mics_datasets_raw/Trinidad and Tobago 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Uzbekistan 2000 MICS_Datasets.zip" = "mics_datasets_raw/Uzbekistan 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Venezuela 2000 MICS_Datasets.zip" = "mics_datasets_raw/Venezuela 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Viet Nam 2000 MICS_Datasets.zip" = "mics_datasets_raw/Viet Nam 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Suriname 2000 MICS_Datasets.zip" = "mics_datasets_raw/Suriname 2000 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Philippines 1999 MICS_Datasets.zip" = "mics_datasets_raw/Philippines 1999 MICS_Datasets.zip",
    "depends/mics_datasets_raw/Zambia 1999 MICS_Datasets.zip" = "mics_datasets_raw/Zambia 1999 MICS_Datasets.zip"))

orderly::orderly_artefact(files = "mics_survey_catalogue.csv", description = "Catalogue of MICS surveys")
orderly::orderly_artefact(
  files = c("mics_datasets_rds/arg2019mics.rds",
            "mics_datasets_rds/guy2019mics.rds",
            "mics_datasets_rds/rks2019mics.rds",
            "mics_datasets_rds/rkr2019mics.rds",
            "mics_datasets_rds/mwi2019mics.rds",
            "mics_datasets_rds/wsm2019mics.rds",
            "mics_datasets_rds/pse2019mics.rds",
            "mics_datasets_rds/tca2019mics.rds",
            "mics_datasets_rds/tuv2019mics.rds",
            "mics_datasets_rds/bgd2019mics.rds",
            "mics_datasets_rds/blr2019mics.rds",
            "mics_datasets_rds/tcd2019mics.rds",
            "mics_datasets_rds/cub2019mics.rds",
            "mics_datasets_rds/dom2019mics.rds",
            "mics_datasets_rds/hnd2019mics.rds",
            "mics_datasets_rds/npl2019mics.rds",
            "mics_datasets_rds/stp2019mics.rds",
            "mics_datasets_rds/srb2019mics.rds",
            "mics_datasets_rds/srr2019mics.rds",
            "mics_datasets_rds/tha2019mics.rds",
            "mics_datasets_rds/ton2019mics.rds",
            "mics_datasets_rds/tkm2019mics.rds",
            "mics_datasets_rds/zwe2019mics.rds",
            "mics_datasets_rds/dza2018mics.rds",
            "mics_datasets_rds/caf2018mics.rds",
            "mics_datasets_rds/gnb2018mics.rds",
            "mics_datasets_rds/kir2018mics.rds",
            "mics_datasets_rds/mkd2018mics.rds",
            "mics_datasets_rds/mkr2018mics.rds",
            "mics_datasets_rds/pas2018mics.rds",
            "mics_datasets_rds/cri2018mics.rds",
            "mics_datasets_rds/gmb2018mics.rds",
            "mics_datasets_rds/geo2018mics.rds",
            "mics_datasets_rds/irq2018mics.rds",
            "mics_datasets_rds/kgz2018mics.rds",
            "mics_datasets_rds/lso2018mics.rds",
            "mics_datasets_rds/mdg2018mics.rds",
            "mics_datasets_rds/mng2018mics.rds",
            "mics_datasets_rds/mne2018mics.rds",
            "mics_datasets_rds/mnr2018mics.rds",
            "mics_datasets_rds/sur2018mics.rds",
            "mics_datasets_rds/tun2018mics.rds",
            "mics_datasets_rds/cod2017mics.rds",
            "mics_datasets_rds/gha2017mics.rds",
            "mics_datasets_rds/pap2017mics.rds",
            "mics_datasets_rds/lao2017mics.rds",
            "mics_datasets_rds/sle2017mics.rds",
            "mics_datasets_rds/tgo2017mics.rds",
            "mics_datasets_rds/nga2016mics.rds",
            "mics_datasets_rds/pag2016mics.rds",
            "mics_datasets_rds/pkk2016mics.rds",
            "mics_datasets_rds/gin2016mics.rds",
            "mics_datasets_rds/mnk2016mics.rds",
            "mics_datasets_rds/mnn2016mics.rds",
            "mics_datasets_rds/pry2016mics.rds",
            "mics_datasets_rds/tha2016mics.rds",
            "mics_datasets_rds/blz2015mics.rds",
            "mics_datasets_rds/sen2015mics.rds",
            "mics_datasets_rds/tha2015mics.rds",
            "mics_datasets_rds/thb2015mics.rds",
            "mics_datasets_rds/tkm2015mics.rds",
            "mics_datasets_rds/kaz2015mics.rds",
            "mics_datasets_rds/mli2015mics.rds",
            "mics_datasets_rds/mrt2015mics.rds",
            "mics_datasets_rds/mex2015mics.rds",
            "mics_datasets_rds/cog2014mics.rds",
            "mics_datasets_rds/ben2014mics.rds",
            "mics_datasets_rds/cmr2014mics.rds",
            "mics_datasets_rds/cub2014mics.rds",
            "mics_datasets_rds/dom2014mics.rds",
            "mics_datasets_rds/slv2014mics.rds",
            "mics_datasets_rds/swz2014mics.rds",
            "mics_datasets_rds/gnb2014mics.rds",
            "mics_datasets_rds/guy2014mics.rds",
            "mics_datasets_rds/kgz2014mics.rds",
            "mics_datasets_rds/npl2014mics.rds",
            "mics_datasets_rds/pap2014mics.rds",
            "mics_datasets_rds/pas2014mics.rds",
            "mics_datasets_rds/stp2014mics.rds",
            "mics_datasets_rds/srb2014mics.rds",
            "mics_datasets_rds/srr2014mics.rds",
            "mics_datasets_rds/pse2014mics.rds",
            "mics_datasets_rds/sdn2014mics.rds",
            "mics_datasets_rds/zwe2014mics.rds",
            "mics_datasets_rds/egy2013mics.rds",
            "mics_datasets_rds/keb2013mics.rds",
            "mics_datasets_rds/kek2013mics.rds",
            "mics_datasets_rds/ket2013mics.rds",
            "mics_datasets_rds/rks2013mics.rds",
            "mics_datasets_rds/rkr2013mics.rds",
            "mics_datasets_rds/mwi2013mics.rds",
            "mics_datasets_rds/mng2013mics.rds",
            "mics_datasets_rds/vnm2013mics.rds",
            "mics_datasets_rds/mne2013mics.rds",
            "mics_datasets_rds/mnr2013mics.rds",
            "mics_datasets_rds/pan2013mics.rds",
            "mics_datasets_rds/dza2012mics.rds",
            "mics_datasets_rds/bgd2012mics.rds",
            "mics_datasets_rds/tha2012mics.rds",
            "mics_datasets_rds/ury2012mics.rds",
            "mics_datasets_rds/brb2012mics.rds",
            "mics_datasets_rds/blr2012mics.rds",
            "mics_datasets_rds/mdg2012mics.rds",
            "mics_datasets_rds/mda2012mics.rds",
            "mics_datasets_rds/mnk2012mics.rds",
            "mics_datasets_rds/mnn2012mics.rds",
            "mics_datasets_rds/qat2012mics.rds",
            "mics_datasets_rds/lca2012mics.rds",
            "mics_datasets_rds/ukr2012mics.rds",
            "mics_datasets_rds/arg2011mics.rds",
            "mics_datasets_rds/bih2011mics.rds",
            "mics_datasets_rds/bir2011mics.rds",
            "mics_datasets_rds/lao2011mics.rds",
            "mics_datasets_rds/tun2011mics.rds",
            "mics_datasets_rds/blz2011mics.rds",
            "mics_datasets_rds/cri2011mics.rds",
            "mics_datasets_rds/gha2011mics.rds",
            "mics_datasets_rds/idp2011mics.rds",
            "mics_datasets_rds/idw2011mics.rds",
            "mics_datasets_rds/irq2011mics.rds",
            "mics_datasets_rds/jam2011mics.rds",
            "mics_datasets_rds/ken2011mics.rds",
            "mics_datasets_rds/lbn2011mics.rds",
            "mics_datasets_rds/mrt2011mics.rds",
            "mics_datasets_rds/nga2011mics.rds",
            "mics_datasets_rds/mkd2011mics.rds",
            "mics_datasets_rds/mkr2011mics.rds",
            "mics_datasets_rds/pap2011mics.rds",
            "mics_datasets_rds/son2011mics.rds",
            "mics_datasets_rds/sos2011mics.rds",
            "mics_datasets_rds/tto2011mics.rds",
            "mics_datasets_rds/afg2010mics.rds",
            "mics_datasets_rds/cub2010mics.rds",
            "mics_datasets_rds/gha2010mics.rds",
            "mics_datasets_rds/kaz2010mics.rds",
            "mics_datasets_rds/vnm2010mics.rds",
            "mics_datasets_rds/btn2010mics.rds",
            "mics_datasets_rds/caf2010mics.rds",
            "mics_datasets_rds/tcd2010mics.rds",
            "mics_datasets_rds/cod2010mics.rds",
            "mics_datasets_rds/swz2010mics.rds",
            "mics_datasets_rds/gmb2010mics.rds",
            "mics_datasets_rds/gnb2010mics.rds",
            "mics_datasets_rds/mng2010mics.rds",
            "mics_datasets_rds/npl2010mics.rds",
            "mics_datasets_rds/pak2010mics.rds",
            "mics_datasets_rds/srb2010mics.rds",
            "mics_datasets_rds/srr2010mics.rds",
            "mics_datasets_rds/sle2010mics.rds",
            "mics_datasets_rds/ssd2010mics.rds",
            "mics_datasets_rds/pse2010mics.rds",
            "mics_datasets_rds/sdn2010mics.rds",
            "mics_datasets_rds/sur2010mics.rds",
            "mics_datasets_rds/tgo2010mics.rds",
            "mics_datasets_rds/mli2009mics.rds",
            "mics_datasets_rds/ken2009mics.rds",
            "mics_datasets_rds/zwe2009mics.rds",
            "mics_datasets_rds/moz2008mics.rds",
            "mics_datasets_rds/vut2007mics.rds",
            "mics_datasets_rds/mrt2007mics.rds",
            "mics_datasets_rds/nga2007mics.rds",
            "mics_datasets_rds/guy2006mics.rds",
            "mics_datasets_rds/bgd2006mics.rds",
            "mics_datasets_rds/blz2006mics.rds",
            "mics_datasets_rds/bih2006mics.rds",
            "mics_datasets_rds/bfa2006mics.rds",
            "mics_datasets_rds/cmr2006mics.rds",
            "mics_datasets_rds/caf2006mics.rds",
            "mics_datasets_rds/cub2006mics.rds",
            "mics_datasets_rds/civ2006mics.rds",
            "mics_datasets_rds/dji2006mics.rds",
            "mics_datasets_rds/gha2006mics.rds",
            "mics_datasets_rds/gnb2006mics.rds",
            "mics_datasets_rds/irq2006mics.rds",
            "mics_datasets_rds/kaz2006mics.rds",
            "mics_datasets_rds/lao2006mics.rds",
            "mics_datasets_rds/mwi2006mics.rds",
            "mics_datasets_rds/som2006mics.rds",
            "mics_datasets_rds/sur2006mics.rds",
            "mics_datasets_rds/syr2006mics.rds",
            "mics_datasets_rds/tgo2006mics.rds",
            "mics_datasets_rds/tto2006mics.rds",
            "mics_datasets_rds/tkm2006mics.rds",
            "mics_datasets_rds/uzb2006mics.rds",
            "mics_datasets_rds/vnm2006mics.rds",
            "mics_datasets_rds/yem2006mics.rds",
            "mics_datasets_rds/gmb2005mics.rds",
            "mics_datasets_rds/kgz2005mics.rds",
            "mics_datasets_rds/lbn2005mics.rds",
            "mics_datasets_rds/mne2005mics.rds",
            "mics_datasets_rds/mkd2005mics.rds",
            "mics_datasets_rds/srb2005mics.rds",
            "mics_datasets_rds/sle2005mics.rds",
            "mics_datasets_rds/tha2005mics.rds",
            "mics_datasets_rds/alb2005mics.rds",
            "mics_datasets_rds/blr2005mics.rds",
            "mics_datasets_rds/bdi2005mics.rds",
            "mics_datasets_rds/geo2005mics.rds",
            "mics_datasets_rds/jam2005mics.rds",
            "mics_datasets_rds/mng2005mics.rds",
            "mics_datasets_rds/tjk2005mics.rds",
            "mics_datasets_rds/ukr2005mics.rds",
            "mics_datasets_rds/ago2001mics.rds",
            "mics_datasets_rds/cod2001mics.rds",
            "mics_datasets_rds/alb2000mics.rds",
            "mics_datasets_rds/aze2000mics.rds",
            "mics_datasets_rds/bol2000mics.rds",
            "mics_datasets_rds/bih2000mics.rds",
            "mics_datasets_rds/bwa2000mics.rds",
            "mics_datasets_rds/bdi2000mics.rds",
            "mics_datasets_rds/cmr2000mics.rds",
            "mics_datasets_rds/caf2000mics.rds",
            "mics_datasets_rds/tcd2000mics.rds",
            "mics_datasets_rds/com2000mics.rds",
            "mics_datasets_rds/civ2000mics.rds",
            "mics_datasets_rds/dom2000mics.rds",
            "mics_datasets_rds/gnq2000mics.rds",
            "mics_datasets_rds/swz2000mics.rds",
            "mics_datasets_rds/gmb2000mics.rds",
            "mics_datasets_rds/gnb2000mics.rds",
            "mics_datasets_rds/guy2000mics.rds",
            "mics_datasets_rds/idn2000mics.rds",
            "mics_datasets_rds/irq2000mics.rds",
            "mics_datasets_rds/ken2000mics.rds",
            "mics_datasets_rds/lao2000mics.rds",
            "mics_datasets_rds/lso2000mics.rds",
            "mics_datasets_rds/mdg2000mics.rds",
            "mics_datasets_rds/mda2000mics.rds",
            "mics_datasets_rds/mng2000mics.rds",
            "mics_datasets_rds/mmr2000mics.rds",
            "mics_datasets_rds/ner2000mics.rds",
            "mics_datasets_rds/rwa2000mics.rds",
            "mics_datasets_rds/stp2000mics.rds",
            "mics_datasets_rds/sen2000mics.rds",
            "mics_datasets_rds/sle2000mics.rds",
            "mics_datasets_rds/ssd2000mics.rds",
            "mics_datasets_rds/tjk2000mics.rds",
            "mics_datasets_rds/tgo2000mics.rds",
            "mics_datasets_rds/tto2000mics.rds",
            "mics_datasets_rds/uzb2000mics.rds",
            "mics_datasets_rds/ven2000mics.rds",
            "mics_datasets_rds/vnm2000mics.rds",
            "mics_datasets_rds/sur1999mics.rds",
            "mics_datasets_rds/phl1999mics.rds",
            "mics_datasets_rds/zmb1999mics.rds"),
  description = "MICS datasets RDS")

library(haven)
library(countrycode)
library(dplyr)



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
  as.list(c("depends/mics_survey_catalogue_filenames.csv" = "mics_survey_catalogue_filenames.csv",
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
