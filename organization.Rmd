# Organization

## Organization of this E-device Document Overall

- Executive Summary: Provides a concise summary of the e-device sub-group goals, methods, and project take-way to date; Table 1 summaries the most notable pros and cons for each software application
- Introduction: Provides more in-depth description of the goals and the approach of the e-device sub-group, including an outline of the IEP e-device questionnaire.
- Software Reviews: Includes reviews of field data entry software applications ("app" or "apps") that were reviewed by the e-device sub-group, starting with a chapter defining the criteria used for the app comparisons. New entries or updated entries are encouraged.
- IEP Survey Demos: Includes chapters describing the hands-on experience of IEP Survey teams that have conducted a trial of one of the e-device apps; IEP demonstrations included might be from entry level to very experienced e-device users/teams.  New entries or updated entries are encouraged.
- Hardware Reviews: Section is a place-holder for any relevant information regarding field data entry devices and associated weather protection products. New entries or updated entries are encouraged.
- External Sensors: Section devoted to the data collection from fish boards and/or other environmental sensors and the potential integration with e-device apps.
- Appendix: Section intended for additional/supplemental information that would support IEP survey teams to better understand e-device approaches presented in Software, hardware, or demonstration sections. 
- Appendix/Expert Network: Provides a listing of IEP associates who are willing to be a contact for new e-device users within IEP who are seeking information to support e-device method decisions.






## Organization of the Bookdown Files


This document uses the bookdown:bs4_book format for HTML output. The file organization is as follows:

  * The main project folder ("edevice2/") contains all files included in this bookdown document, including the data tables and scripts used to populate the document tables. The main folder of the project contains all the .Rmd files for the whole book. 
 
  * 01-intro.Rmd, 02-survey.Rmd, etc.: These are the chapter files of the e-device book located in the main project folder; The .Rmd chapter files are included in the bookdown document in the order listed in the _bookdown.yml file. Only the .Rmd files associated the software review chapters have numbered file names. A chapter *must* start with a first-level heading: `# A good chapter`, and can contain one (and only one) first-level heading.

  * _bookdown.yml: This file contains the configuration options of the e-device book, including the output format, the location of the chapters, and the order of the chapters.
  
  * _output.yml: This file contains the configuration options for the output format, such as the theme, the CSS, and the JavaScript.
  
  * index.Rmd: This file contains the content for this current page providing this orientation material. It also contains the front matter for the book, such as the title, the author, and the date, as well as the table of contents.  
  
  * _book/: This is the directory where the compiled book is stored. It contains all the HTML, CSS, and JavaScript files that make up the book.  Files in the _book directory should NOT be edited.
  
  * images/: This is the directory that contains all static images (images not derived by R code chunk) that are included in the e-device book.  The static images (e.g., screen clips) are organized in folders by chapter.
  
  * data_scripts/: This is the directory that contains all data handing scripts used in the e-device book.  Currently, one data read script is run prior to rendering the book. This script output .rds data tables to the main edevice2 folder for access by the Rmd files.
  
  * tables/: Excel files associated with the tables generated in this bookdown document are located in the tables/ folder.
  
  * style.css: contains css formatting instructions.  Beyond default settings, a couple of css codes for table formatting have been added.
  
