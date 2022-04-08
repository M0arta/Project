pwd
cd Coding_Project
cd Code

/*Install packages in STATA*/

run installation_code.dta 


/*import and clean the two datasets: the Istat one with all the variable beside the number of sttudents enrolled in eahc university and the list of  the latter in the second one*/

run Cleaning_enrol.do

clear

run Cleaning_Istat_2015.do

/*run the python Project in the propt*/

pwd 
cd Coding_Project/Code
python Project.py

/* back to STATA and clean the datframe created in python*/

run Cleaning_region 

/*merge before the Instat ds with the region ds then the merged oone with the enrolment */

run merging.do


