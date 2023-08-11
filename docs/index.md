--- 
title: "Electronic Data Entry Options for IEP Surveys"
author: "IEP DUWG 'e-Device' Sub-group led by Karrin Alstad"
date: "2023-08-11"
site: bookdown::bookdown_site
url: "https://interagencyecologicalprogram.github.io/e-device/"
documentclass: book
description: "This bookdown document is intended to summarize the research collected
  by IEP DUWG members regarding the use of electronic data entry tools in IEP Surveys.
  This project is in-progress and has not been fully reviewed by the IEP DUWG e-device
  team."
bibliography:
- book.bib
- packages.bib
biblio-style: apalike
csl: "chicago-fullnote-bibliography.csl"
always_allow_html: yes
---

# Electronic Data Entry Options for IEP Surveys  {-}

## Preamble

**This bookdown document is intended as a repository of technical information related to the use of electronic field data entry tools**, including reviews of different software options, hardware, and factors regarding interfacing with external sensors and downstream databases.  

The initial information was gleaned from interviews and presentations organized during a DUWG Electronic Data Entry Device ("e-device") focus group (6/2022-6/2023), but these reports are far from exhaustive and there are many software/hardware options for field data entry that have not yet been reviewed.  Meanwhile communication and cloud processing technology is advancing rapidly.  

**This initiative generally asks that all IEP survey teams that have e-device experience, or those that are adding digital data-entry tools to their program, please share these experiences and help to develop this resource for other IEP surveys seeking to update data entry protocols.**



<img src="images/bothlogo.JPG" width="70%" style="display: block; margin: auto;" />




## **How to Contribute: Two Ways**

<!-- # specifying font style for bold because H3 does not render bold "**" option-->
::: {#Tab1  style="font-size:18px; font-family: Segoe UI;"}
**Best Way: Submit changes to the e-device package using Github:** 
:::

1. Create a fork off of the primary package: https://github.com/GitKarIn/e-device2.git

2. Clone this fork to your own local repository

3. Render the book:

-  Click on the Build pane in the RStudio IDE and Click on Build Book tool

-  Or, build the book from the R console:

```r
bookdown::render_book()
```

4. Compose changes or updates to the book contents

5. Check for merge conflicts and submit a pull request

<!-- # specifying font style for bold because H3 does not render bold "**" option-->
::: {#Tab1  style="font-size:18px; font-family: Segoe UI;"}
**Back-up Way: Email proposed changes/edits to the document manager:** 
:::


1. Print to pdf each page of the document that needs to be changed using the web browser print options (*Note: The current version is not rendered a pdf doc due to a conflict with Kable(). Input welcome*)

2. Use a pdf editor to insert comments or changes.

3. E-mail these edited pdf pages to: karrin.alstad@wildlife.ca.gov



## Bookdown File Organization


This document is configured using the bookdown::bs4_book format for HTML output and the file organization is as follows:

  * The main project folder ("edevice2/") contains all files included in this bookdown document, including the data tables and scripts used to populate the document tables. The main folder of the project contains all of the .Rmd files that compose one (and only one) chapter. 
 
  * 01-intro.Rmd, 02-survey.Rmd, etc.: These are the chapter files of the e-device book, which are numbered in the order that they appear in the table of contents.  A chapter *must* start with a first-level heading: `# A good chapter`, and can contain one (and only one) first-level heading.

  * _bookdown.yml: This file contains the configuration options f the e-device book, including the output format, the location of the chapters, and the order of the chapters [if numbers are not used].
  
  * _output.yml: This file contains the configuration options for the output format, such as the theme, the CSS, and the JavaScript.
  
  * index.Rmd: This file contains the content for this current page providing this orientation material. It also contains the front matter for the book, such as the title, the author, and the date, as well as the table of contents.  
  
  * _book/: This is the directory where the compiled book is stored. It contains all of the HTML, CSS, and JavaScript files that make up the book.  Files in the _book directory should NOT be edited.
  
  * images/: This is the directory that contains all static images (images not derived by R code chunk) that are included in the e-device book.  The static images (e.g., screen clips) are organized in folders by chapter.
  
  * data_scripts/: This is the directory that contains all data handing scripts used in the e-device book.  Currently, one data read script is run prior to rendering the book. This script output .rds data tables to the main edevice2 folder for access by the Rmd files.
  
  * tables/: Excel files associated with the tables generated in this bookdown document are located in the tables/ folder.
  
  * style.css: contains css formatting instructions.  Beyond default settings, a couple of css codes for table formatting have been added.
  



