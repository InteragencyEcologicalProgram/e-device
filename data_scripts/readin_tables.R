library(readxl)
library(dplyr)
library(here)

# reset tabs for testing readin_tables.R as a stand alone
tabs <-    here("tables")

read_excel_allsheets <- function(filename, tibble = FALSE) {
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}

## e-device survey results

Survey <- read_excel(file.path(tabs,"Survey1.xlsx"),sheet = "Sheet1")


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
## Save to .rds file ##
# Maybe I don't need to save to rds

popapps <- read_excel(file.path(tabs,"most_common_apps.xlsx"),sheet = "Sheet1")
popapps[is.na(popapps)] <- " "


## pros cons table for summary
proscons <- read_excel(file.path(tabs,"ProsCons2.xlsx"))


## pros cons table for summary
criteria <- read_excel_allsheets(file.path(tabs,"Template_app_criteria_intro.xlsx"))


## e-device criteria table for intro
criteria <- read_excel_allsheets(file.path(tabs,"Template_app_criteria_intro.xlsx"))


## speakers
speakrs <- read_excel(file.path(tabs,"speakers_locals.xlsx"))

## expert network
experts <- read_excel(file.path(tabs,"ExpertNet.xlsx"))


## software criteria tables
## remove score column; not going to try to compare using scoring approach
survey123 <- read_excel_allsheets(file.path(tabs,"Survey123_app_criteria2.xlsx"))
powerapp <- read_excel_allsheets(file.path(tabs,"Power_app_criteria.xlsx"))
fulcrum <- read_excel_allsheets(file.path(tabs,"Fulcrum.xlsx"))
feed <- read_excel_allsheets(file.path(tabs,"FEED_criteria.xlsx"))
bigfin <- read_excel_allsheets(file.path(tabs,"BigFin_criteria.xlsx"))


## Table-Making Functions for each section of the app criteria tables

formtable <- function(appform, tibble = FALSE) {
  appform[] <- lapply(appform, function(x) ifelse(is.na(x), "", x))
  appform %>%
    # Group by category column and collapse repeating values
    group_by(Category) %>%
    mutate(Category = ifelse(duplicated(Category), "", Category))  %>%
    group_by(Feature) %>%
    mutate(Feature = ifelse(duplicated(Feature), "", Feature))  %>%
    kable(appform, format = "html", escape = F, caption = 'Forms Options',
          col.names = c("Category","Feature"	,"Available","Description",		"Group Notes","External  Reviews"),
          booktabs = TRUE, align =  "l") %>%
    kable_paper() %>% 
    kable_styling(full_width =FALSE, fixed_thead = TRUE, font_size = 18) %>%
    
    column_spec(1, width_min = "2.5cm", bold = TRUE,) %>%
    column_spec(1, width_max = "3cm", bold = TRUE) %>%
    column_spec(2, width_min = "2.5cm" ) %>%
    column_spec(2, width_max = "3cm" ) %>%
    column_spec(3, width_min = "1.5cm") %>%
    column_spec(3, width_max = "2cm") %>%
    column_spec(4, width_min = "2cm") %>%
    column_spec(4, width_max = "5cm") %>%
    column_spec(5, width_min = "2cm") %>%
    column_spec(5, width_max = "5cm") %>%
    column_spec(6, width_min = "2cm") %>%  
    column_spec(6, width_max = "5cm") %>%  
    scroll_box(width = "800px", height = "600px") 
  
}


datatable <- function(appdata, tibble = FALSE) {
  appdata[] <- lapply(appdata, function(x) ifelse(is.na(x), "", x))
  appdata %>%
    # Group by category column and collapse repeating values
    group_by(Category) %>%
    mutate(Category = ifelse(duplicated(Category), "", Category))  %>%
    group_by(Feature) %>%
    mutate(Feature = ifelse(duplicated(Feature), "", Feature))  %>%
    kable(appdata, format = "html", escape = F, caption = 'Data Interface Options',
          col.names = c("Category","Feature"	,"Available","Description",		"Group Notes","External  Reviews"),
          booktabs = TRUE, align =  "l") %>%
    kable_paper() %>% 
    kable_styling(full_width =FALSE, fixed_thead = TRUE, font_size = 18) %>%
    
    column_spec(1, width_min = "2.5cm", bold = TRUE,) %>%
    column_spec(1, width_max = "3cm", bold = TRUE) %>%
    column_spec(2, width_min = "2.5cm" ) %>%
    column_spec(2, width_max = "3cm" ) %>%
    column_spec(3, width_min = "1.5cm") %>%
    column_spec(3, width_max = "2cm") %>%
    column_spec(4, width_min = "2cm") %>%
    column_spec(4, width_max = "5cm") %>%
    column_spec(5, width_min = "2cm") %>%
    column_spec(5, width_max = "5cm") %>%
    column_spec(6, width_min = "2cm") %>%  
    column_spec(6, width_max = "5cm") %>%  
    scroll_box(width = "800px", height = "600px") 
}

phototable <- function(appphot, tibble = FALSE) {
  appphot[] <- lapply(appphot, function(x) ifelse(is.na(x), "", x))
  
  appphot %>%
    # Group by category column and collapse repeating values
    group_by(Category) %>%
    mutate(Category = ifelse(duplicated(Category), "", Category))  %>%
    group_by(Feature) %>%
    mutate(Feature = ifelse(duplicated(Feature), "", Feature))  %>%
    kable(appphot, format = "html", escape = F, caption = 'Photo Integration and External Sensors',  
          col.names = c("Category","Feature"	,"Available","Description",	"Group Notes","External  Reviews"),
          booktabs = TRUE, align =  "l") %>%
    kable_paper() %>% 
    kable_styling(full_width =FALSE, fixed_thead = TRUE, font_size = 18) %>%
    
    column_spec(1, width_min = "2.5cm", bold = TRUE,) %>%
    column_spec(1, width_max = "3.5cm", bold = TRUE) %>%
    column_spec(2, width_min = "2.5cm" ) %>%
    column_spec(2, width_max = "4cm" ) %>%
    column_spec(3, width_min = "2cm") %>%
    column_spec(3, width_max = "2.5cm") %>%
    column_spec(4, width_min = "4cm") %>%
    column_spec(4, width_max = "5.5cm") %>%
    column_spec(5, width_min = "4cm") %>%
    column_spec(5, width_max = "5.5cm") %>%
    
    scroll_box(width = "800px", height = "600px") 
}


hardtable <- function(apphard, tibble = FALSE) {
  apphard[] <- lapply(apphard, function(x) ifelse(is.na(x), "", x)) 

kable(apphard, format = "html", escape = F, caption = 'Hardware Platform Options',
      col.names = c("Feature"	,"Available",	"Group Notes","External  Reviews"),
      booktabs = TRUE, align =  "l") %>%
  kable_paper() %>% 
  kable_styling(full_width =FALSE, fixed_thead = TRUE, font_size = 18) %>%
  
  column_spec(1, width_min = "7cm", bold = TRUE) %>%
  column_spec(1, width_max = "8cm", bold = TRUE) %>%
  column_spec(2, width_min = "3cm" ) %>%
  column_spec(2, width_max = "3.5cm" ) %>%
  column_spec(3, width_min = "4.5cm") %>%
  column_spec(3, width_max = "5cm") %>%
  column_spec(4, width_min = "4.5cm") %>%
  column_spec(4, width_max = "5cm") %>%
  
  scroll_box(width = "800px", height = "600px") 
}


sectable <- function(appsecr, tibble = FALSE) {
  appsecr[] <- lapply(appsecr, function(x) ifelse(is.na(x), "", x))

  kable(appsecr, format = "html", escape = F, caption = 'Security Factors', booktabs = TRUE, align =  "l",col.names = c("Feature"	,"Available",	"Description","Group Notes","External  Reviews")) %>%
    kable_paper() %>% 
    kable_styling(full_width =FALSE, fixed_thead = TRUE, font_size = 18) %>%
    
    column_spec(1, width_min = "3cm", bold = TRUE) %>%
    column_spec(1, width_max = "4cm", bold = TRUE) %>%
    column_spec(2, width_min = "2cm" ) %>%
    column_spec(2, width_max = "3cm" ) %>%
    column_spec(3, width_min = "3cm") %>%
    column_spec(3, width_max = "4cm") %>%
    column_spec(4, width_min = "4.5cm") %>%
    column_spec(4, width_max = "5cm") %>%
    column_spec(5, width_min = "4.5cm") %>%
    column_spec(5, width_max = "5cm") %>%
    
    scroll_box(width = "800px", height = "600px") 
}


bustable <- function(appbusi, tibble = FALSE) {
  appbusi[] <- lapply(appbusi, function(x) ifelse(is.na(x), "", x))
  
  kable(appbusi, format = "html", escape = F, caption = 'Security Factors', booktabs = TRUE, align =  "l",col.names = c("Feature"	,"Available",	"Description","Group Notes","External  Reviews")) %>%
    kable_paper() %>% 
    kable_styling(full_width =FALSE, fixed_thead = TRUE, font_size = 18) %>%
    
    column_spec(1, width_min = "3cm", bold = TRUE) %>%
    column_spec(1, width_max = "4cm", bold = TRUE) %>%
    column_spec(2, width_min = "2cm" ) %>%
    column_spec(2, width_max = "3cm" ) %>%
    column_spec(3, width_min = "3cm") %>%
    column_spec(3, width_max = "4cm") %>%
    column_spec(4, width_min = "4.5cm") %>%
    column_spec(4, width_max = "5cm") %>%
    column_spec(5, width_min = "4.5cm") %>%
    column_spec(5, width_max = "5cm") %>%
    
    scroll_box(width = "800px", height = "600px") 
}

