# Executive Summary {-}

## **Take Home Message:** {-}

**IEP should transition to electronic data entry in order to improve efficiency and data quality.**

Digital data entry methods facilitate more accurate and rapid reporting of survey data - as compared to paper data sheets - by reducing field entry errors, eliminating manual entry QC checks, and improving overall processing efficiency. 


## **Problem:** {-}

**IEP still uses paper data sheets for most surveys.**  

**IEP survey leads have significant questions about electronic data entry methods.** Several surveys have tried out different e-devices for collecting field data, but they haven't been broadly adopted due to lack of available information about which tools are most appropriate for survey applications.  



## **Methods:** {-}

The DUWG formed a sub-team and carried out the following steps:

1. **Polled IEP survey teams** to learn what digital data entry tools are currently used within the IEP network; 
2. **Evaluated the top software tools** with interviews/presentations from experienced users and product vendors; 
3. **Conducted software trials** using apps specifically configured for IEP survey data collections;
4. **Developed an open-document forum** for exchange of technical information on e-devices across IEP;
5. **Summarized pros and cons** of the top e-device software options.


## **Solutions:** {-}

Two tools were developed to promote the transition to electronic data entry methods:

- **Summarized and expanded listing of the specific pros and cons of each of the top data entry software apps (Table 1 below)**

- **An open-access html document and Github repository for information related to electronic field data entry software/hardware for IEP Survey applications (Link to [Github repo](https://github.com/InteragencyEcologicalProgram/e-device) and [E-device document Introduction](#intro))**


## **Impacts:** {-}

Adopting digital data entry protocols will require time to develop the platforms and software and to train the staff. In addition, IEP surveys will have to budget for the purchase and maintenance of mobile field devices, data loggers and/or electronic fish measurement boards. **In the longer term, the time and staff-power savings in reduced data entry and post-collection processing will significantly outweigh equipment and training time expenditures.**


## **Table 1:** {-}

<!-- # specifying font style for bold because H3 does not render bold "**" option-->
::: {#Tab1  style="font-size:18px; font-family: Segoe UI;"}
**Table 1:  The top software tools used for field data entry are listed and the Pros and Cons of each tool are briefly described for each [criteria category](#crittop).**
:::



<div style="border: 1px solid #ddd; padding: 5px; overflow-x: scroll; width:800px; "><table class=" lightable-paper table" style='font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 18px; width: auto !important; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Software </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Forms </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Data Interface </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> External Devices </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> HW Platform Compatibility </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Security </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Business Model/Price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> ESRI Survey123 </td>
   <td style="text-align:left;max-width: 7cm; "> **Pros:** Geo-referencing of all objects; map layers available; </td>
   <td style="text-align:left;max-width: 10cm; "> **Cons**: difficult to configure desired format to view/edit data 'on-the-fly'  in the field </td>
   <td style="text-align:left;"> **Cons:** Cannot connect to sensors directly </td>
   <td style="text-align:left;"> **Pros:**  Can be run on all platform types: ios, Android, and PC (web only) </td>
   <td style="text-align:left;"> **Pros:** thoroughly vetted in state agencies </td>
   <td style="text-align:left;"> Expensive; but well established CA state license agreement </td>
  </tr>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> MS Power Apps </td>
   <td style="text-align:left;max-width: 7cm; "> **Pros:**Low-code/No-code; customizable; Uses Excel-like function; AI support </td>
   <td style="text-align:left;max-width: 10cm; "> **Pros:**  Power Platform connection provide easy connectivity to SQL, OneDrive databases.

**Cons:** Even though Power Apps can be run on a Windows system (on/off-line), it cannot read in data from local drive </td>
   <td style="text-align:left;"> **Pros:** It is possible to control external devices using PowerApps

**Cons:** An Azure license is required to connect to external devices (not available with Power Apps for Government Plans) </td>
   <td style="text-align:left;"> **Pros:**  Can be run on all platform types: ios, Android, and Window (including off-line) </td>
   <td style="text-align:left;"> **Pros:** thoroughly vetted in state agencies </td>
   <td style="text-align:left;"> Moderate </td>
  </tr>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> Fulcrum </td>
   <td style="text-align:left;max-width: 7cm; "> **Pros:**  Intuitive form-building interface; Auto-formating for modern look; 

**Cons:**  Complex design requires coding; Limits to nesting data </td>
   <td style="text-align:left;max-width: 10cm; "> **Pros:**  Provides many types of API connections e.g., to SQL, OneDrive </td>
   <td style="text-align:left;"> **Cons:** Even though Power Apps can be run on a Windows system (on/off-line), it cannot read in data from local drive </td>
   <td style="text-align:left;"> **Pros:**  Can be run on all platform types: ios, Android, and PC (web only) </td>
   <td style="text-align:left;"> **Pros:**security audits for projects with aerospace company, toyota, verison, telegraph </td>
   <td style="text-align:left;"> Moderate </td>
  </tr>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> Pendragon </td>
   <td style="text-align:left;max-width: 7cm; ">  </td>
   <td style="text-align:left;max-width: 10cm; ">  </td>
   <td style="text-align:left;"> **Cons:**  Cannot read in data from local drive; cannot connect to sensors directly </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> **Cons:** Not FedRAMP certified </td>
   <td style="text-align:left;"> Moderate </td>
  </tr>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> FEED </td>
   <td style="text-align:left;max-width: 7cm; "> **Pros:**  Customized form specific to users application; Designed specifically for fish surveys </td>
   <td style="text-align:left;max-width: 10cm; "> **Pros:**  Built on local Access db so compatible will all M.S. connectivity

**Cons:** No built in Cloud connectivity; no built in API </td>
   <td style="text-align:left;"> **Pros:**  Can connect to external sensors; uses local area network </td>
   <td style="text-align:left;"> **Cons:**  Only works on Windows </td>
   <td style="text-align:left;"> **Pros:**LAN based system so low security risk </td>
   <td style="text-align:left;"> One-time configuration fee (~$2000)

**Cons:** One person company; questions about future company composition </td>
  </tr>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> Big Fin </td>
   <td style="text-align:left;max-width: 7cm; "> **Pros:**Designed specifically for fish surveys </td>
   <td style="text-align:left;max-width: 10cm; "> **Cons:** API connection to Cloud base data or transfer needs to be customized </td>
   <td style="text-align:left;"> **Pros:**  Connects directly to many types of external sensors </td>
   <td style="text-align:left;"> **Cons:**  Only works on Android </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Moderate </td>
  </tr>
  <tr>
   <td style="text-align:left;max-width: 4.5cm; font-weight: bold;"> PDF/R-scraping </td>
   <td style="text-align:left;max-width: 7cm; "> **Cons:**  Not as many options to control PDF form input </td>
   <td style="text-align:left;max-width: 10cm; "> **Pros:**R-based PDF scraped data can be formated in R and transferred remotely with R-based API protocols;

**Cons:** All data configuratons must be programmed </td>
   <td style="text-align:left;"> **Cons:**  No photo options; no options to connect to external sensors </td>
   <td style="text-align:left;"> **Pros:** PDF forms are usable on all platform types; PDF forms may be used on mobile apps using Adobe Reader app </td>
   <td style="text-align:left;"> **Pros:**low security risk </td>
   <td style="text-align:left;"> **Pros:**Least expensive approach </td>
  </tr>
</tbody>
</table></div>




