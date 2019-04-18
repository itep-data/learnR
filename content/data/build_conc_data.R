ozone <- read_csv("X:/Agency_Files/Outcomes/Risk_Eval_Air_Mod/_Air_Risk_Evaluation/R/R_Camp/ITEP/Web/learnR/content/data/OZONE_samples.csv")


ozone <- ozone %>%
  mutate(ozone = ifelse(UNITS == "PPB", OZONE/1000, OZONE),
         units = "PPM")


write_csv(ozone, "X:/Agency_Files/Outcomes/Risk_Eval_Air_Mod/_Air_Risk_Evaluation/R/R_Camp/ITEP/Web/learnR/content/data/OZONE_samples.csv")


##met_data_prep


met_data <- read_csv("X:/Agency_Files/Outcomes/Risk_Eval_Air_Mod/_Air_Risk_Evaluation/R/Presentations/2017_NTF presentation/NTF_learn_R/MET_data_2012-2017.csv")

met_data <- met_data %>%
  select(time, windSpeed, windBearing, site_catid, temperature) %>%
  rename(wd = windBearing,
         ws = windSpeed,
         site = site_catid) %>%
  mutate(date_time = ymd_hms(time),
         date = date(date_time),
         hour = hour(date_time),
         time = NULL,
         year = year(date_time))


year_site <- met_data %>%
  select(site, year) %>%
  unique()

library(stringr)
fl_dul <- readRDS("X:/Agency_Files/Outcomes/Risk_Eval_Air_Mod/_Air_Risk_Evaluation/R/Presentations/2017_NTF presentation/NTF_learn_R/data/AQS for FondduLac and Duluth.Rdata")

fl_dul <- fl_dul %>%
  ungroup() %>%
  select(StateCode, CountyCode, SiteNum, Date, Time, Latitude, Longitude, Conc) %>%
  mutate(messy_date = paste(Date, Time),
         site = paste0(StateCode, "-", str_pad(CountyCode, 3, side = "left", 0), "-", str_pad(SiteNum, 4, side = "left", 0)),
         StateCode = NULL,
         CountyCode = NULL,
         SiteNum = NULL,
         Date = NULL,
         Time = NULL,
         date_time = ymd_hm(messy_date),
         date = date(date_time),
         hour = hour(date_time),
         units = "PPM") %>%
  rename_all(toupper) 

fl_dul <- fl_dul %>%
  rename(OZONE = CONC) %>%
  filter(SITE %in% c("27-137-7001", "27-017-7417", "27-137-7554"),
         OZONE < 1)

fl_dul <- left_join(fl_dul, met_data, by = c("DATE" = "date", "SITE" = "site", "HOUR" = "hour")) 

ozone <- fl_dul %>%
  filter(!is.na(temperature)) %>%
  select(MESSY_DATE, SITE, OZONE, LATITUDE, LONGITUDE, temperature, UNITS) %>%
  unique()

write_csv(ozone, "X:/Agency_Files/Outcomes/Risk_Eval_Air_Mod/_Air_Risk_Evaluation/R/R_Camp/ITEP/Web/learnR/content/data/OZONE_samples.csv")

met_data <- fl_dul %>%
  filter(!is.na(temperature)) %>%
  select(DATE, HOUR, ws, wd, SITE) %>%
  rename_all(tolower)

write_csv(met_data, "X:/Agency_Files/Outcomes/Risk_Eval_Air_Mod/_Air_Risk_Evaluation/R/R_Camp/ITEP/Web/learnR/content/data/met_data.csv")
