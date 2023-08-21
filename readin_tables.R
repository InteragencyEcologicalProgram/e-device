library(readxl)
library(dplyr)
library(here)

read_excel_allsheets <- function(filename, tibble = FALSE) {
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}
Xdatfldr = here("tables")

## e-device survey results

Survey <- read_excel(file.path(Xdatfldr,"Survey1.xlsx"),sheet = "Sheet1")


Survey1 <- Survey %>% 
  select(-`Completion time`,-Email,-"Contact Email (optional)",-"Contact Phone (optional)",-Name) %>% 
  rename(name="Contact name",Agency="Contact Agency/Affiliation")

Survey3 <- Survey1 %>%
  rename( 
    dev_exp=5,
    exp_status=6,
    field_app = 7,
    what_hard  = 8,
    weather_case =9,
    what_soft = 10,
    yr_reasons = 11,
    you_dem =12,
    type_data = 13,
    dev_consid =14,
    key_challenges =15,
    type_data_nohope =16,
    whathaveyoutried =17,
    reas_nodevice =18,
    hrdwr_feachz = 19,
    sftwr_feachz = 20,
    other_feachz = 21,
    extern_contact = 22)

Survey3$Agency[grepl("CDFW",Survey3$Agency)]<-"CDFW"
Survey3$Agency[grepl("USFWS",Survey3$Agency)]<-"USFWS"
Survey3$Agency[grepl("Water Resources",Survey3$Agency)]<-"DWR"
Survey3$Agency[grepl("Fish and Wildlife",Survey3$Agency)]<-"CDFW"
Survey3$Agency[grepl("UC",Survey3$Agency)]<-"UC"

Survey3$exp_status[grepl("I have previously used",Survey3$exp_status)]<-"I have previously used"
Survey3$exp_status[grepl("I am currently using",Survey3$exp_status)]<-"I am currently using"

## Save to .rs file ##

saveRDS(Survey3, file = "Survey3.rds")

popapps <- read_excel(file.path(Xdatfldr,"most_common_apps.xlsx"),sheet = "Sheet1")
popapps[is.na(popapps)] <- " "
saveRDS(popapps, file = "popapps.rds")


## speakers
speakrs <- read_excel_allsheets(file.path(Xdatfldr,"speakers_locals.xlsx"))
saveRDS(speakrs$Sheet1, file = "speakrs.rds")

## e-device criteria table for intro
criteria <- read_excel_allsheets(file.path(Xdatfldr,"Template_app_criteria_intro.xlsx"))
saveRDS(criteria, file = "criteria.rds")

# ProsCons
proscons <- read_excel_allsheets(file.path(Xdatfldr,"ProsCons2.xlsx"))
proscons <- as.data.frame(proscons[1])

## software criteria tables
survey123 <- read_excel_allsheets(file.path(Xdatfldr,"Survey123_app_criteria2.xlsx"))
powerapp <- read_excel_allsheets(file.path(Xdatfldr,"Power_app_criteria.xlsx"))
fulcrum <- read_excel_allsheets(file.path(Xdatfldr,"Fulcrum.xlsx"))

