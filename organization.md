# Organization


## Organization of this Bookdown File


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
  
