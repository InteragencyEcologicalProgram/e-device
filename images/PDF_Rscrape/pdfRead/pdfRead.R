library(tabulizer)
library(dplyr)
library(tidyr)
library(stringr)

# Purpose -----------------------------------------------------------------
# Using various tools in R, try to extract information from a pdf file to an electronic format

# Outline -----------------------------------------------------------------

# 1. Can tabulizer be used on the current datasheet file?
# 2. How is the formatting?
# 3. How much additional formatting do I need to do?
# 4. Putting it altogether: How to theoretically extract all information of relevance from a file?
# 5. Conclusion

# Whole document ----------------------------------------------------------

# Save document after values have been filled in the forms
extract_tables(file.path("pdfRead", "Bay Study field sheet front_fill2_data.pdf"))

tableAll <- extract_tables(file.path("pdfRead", "bayStudyExample.pdf"))
tableAll
# Doesn't work very well

# # Try the different algos:
# extract_tables(file.path("pdfRead", "bayStudyExample.pdf"), method = "lattice")
# extract_tables(file.path("pdfRead", "bayStudyExample.pdf"), method = "stream")
# # Still doesn't work as intended

# Provide specific area ---------------------------------------------------

# First, locate area that you want
locate_areas(file.path("pdfRead", "Bay Study field sheet front_fill2_data.pdf"))

# First, focus on just a small table within the datasheet
extract_tables(file.path("pdfRead", "Bay Study field sheet front_fill2_data.pdf"), 
               area = list(c(176.8358, 35.8913, 393.9738, 601.7659)), pages = 1, guess = F)

table <- extract_tables(file.path("pdfRead", "bayStudyExample.pdf"), pages = 1,
                        area = list(c(176.8358, 35.8913, 393.9738, 601.7659)), guess = F, 
                        output = "data.frame")

# Cleaning up formatting
table[[1]] %>% 
  .[-1, ] %>% 
  setNames(c("Species", "S", "Plus", "Specimen1", "Specimen2", "Specimen3", 
             "Specimen4", "Specimen5")) %>% 
  data.frame() %>% 
  pivot_longer(c("Specimen1", "Specimen2", "Specimen3", 
                 "Specimen4", "Specimen5"),
               # contains("Specimen"), 
               names_to = "Specimen", values_to = "Length") %>% 
  mutate(Sex = str_extract(Length, "[:upper:]"),
         Length = str_extract(Length, "\\d+"),
         across(c(S, Plus, Length),
                as.numeric)) %>% 
  filter(!(is.na(S) & is.na(Plus) & is.na(Length) & is.na(Sex)))

# Extracting text ---------------------------------------------------------
# Two approaches:
# 1. relying on the static location of values
# 2. sequentially extracting information of value from the document

# Using the static locations ----------------------------------------------

locate_areas(file.path("pdfRead", "bayStudyExample.pdf"))
extract_text(file.path("pdfRead", "bayStudyExample.pdf"), pages = 1,
             area = list(c(85.65103, 199.65222, 117.02814, 348.05747))) %>% 
  str_extract("\\d.+") %>% 
  gsub("\\s|\\.", "", .) %>% 
  sub("(\\d{2})(\\d+)", "\\1.\\2", .) %>% 
  as.numeric()

# Sequentially extracting -------------------------------------------------

library(pdftools)
stringToExtract <- pdf_text(file.path("pdfRead", "bayStudyExample.pdf"))

crew <- str_extract(stringToExtract, "(?<=Station ).*(?=\\n)")

newStringToExtract <- str_split(stringToExtract, c(paste0(crew, "\n")))[[1]][2]

year <- str_extract(newStringToExtract, "\\d\\s\\d\\s\\d\\s\\d")

newStringToExtract <- str_split(newStringToExtract, year)[[1]][2]

month <- str_extract(newStringToExtract, "\\d\\s\\d")

values <- lapply(c(crew, year, month), function(x) gsub("\\s+", "", x)) %>% 
  setNames(c("crew", "year", "month"))

# Warning:
# CANNOT find check marks
extract_text(file.path("pdfRead", "bayStudyExample.pdf"), pages = 1,
               area = list(c(145.0131, 511.7273, 186.5666, 592.2901)))

# Conclusion --------------------------------------------------------------

# PDF scraping in R is very much possible, however, I would only recommend it if 
# the pdf is set up initially to be scraped from. Even then, this approach is
# very much LESS user friendly than other approaches with dedicated 
# infrastructure to read data into an electronic tabular database. You should
# only use this approach if you truly have to.

data.frame("features" = c("Ease of use", "Automated", "Code Knowledge", "Recommend"),
           "tabulizer" = c("Medium", "Yes", "Medium High", "No"),
           "pdftools" = c("Easy", "Yes", "Very High", "Very No"))

# Extra -------------------------------------------------------------------

# Although I cannot recommend it, this is truly a powerful approach. Using an
# example with correctly formatted tables:

tables <- extract_tables(file.path("pdfRead", "PayPeriodsDGS.pdf"), method = "stream")

# Which is the master table?
masterTableLocation <- which(sapply(tables, function(x) x[1, 1] == "Year"))
# Cleaning up the tables
# Table 6 is the master table showing which schedule table each year will follow:
masterTable <- data.frame(year = c(tables[[masterTableLocation]][1, 2:12], 
                                   tables[[masterTableLocation]][4, 2:12], 
                                   tables[[masterTableLocation]][7, 2:12]), 
                          pattern = c(tables[[masterTableLocation]][2, 2:12], 
                                      tables[[masterTableLocation]][5, 2:12], 
                                      tables[[masterTableLocation]][8, 2:12])) %>% 
  mutate(across(everything(), as.numeric)) %>% 
  filter(!is.na(year))

priorityTable <- lapply(tables[-masterTableLocation], function(x) {

  if (grepl("PATTERN", x[1, 1])) {
    data.frame(x) %>% 
      mutate(pattern = gsub("[^0-9]", "", X1[1])) %>% 
      filter(X2 %in% c(month.name)) %>% 
      separate(X3, into = c("startDate", "endDate"), sep = " to ") %>% 
      transmute(pattern, month = X2, startDate, endDate, numberPaydays = X4)
  } else {
    data.frame(x) %>% 
      filter(X1 %in% c(month.name)) %>% 
      separate(X2, into = c("startDate", "endDate"), sep = " to ") %>% 
      transmute(month = X1, startDate, endDate, numberPaydays = X3)
  }
}) %>% 
  bind_rows() %>% 
  fill(pattern, .direction = "down")

priorityTable %>% 
  filter(pattern == (masterTable %>%
                       filter(year == format(Sys.time(), "%Y")) %>% 
                       pull(pattern)),
         month == month.name[as.numeric(format(Sys.time(), "%m"))])
