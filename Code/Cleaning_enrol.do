/* Find the right working directory*/

pwd

cd/
cd home
cd marta
cd Coding_Project
cd Data
 cd Raw
/home/marta/Coding_Project/Data/Raw

/*import the data  set */


import delimited iscrittixateneo.csv
 
browse
 
/*generate a numeric dummy for sex starting from a string dummy */
 
codebook sesso 
encode sesso, gen(sex) 
tab sex
drop sesso

/*Rename variables from italian to English*/

rename ateneocod uni_code

rename annoa year

rename ateneonome uni_name

rename isc n_enrl

/*label variables */

lab var n_enrl "Number of students enrolled"

lab var sex "Dummy for sex = 1 if female"

lab var uni_code "University id"

lab var year "Accademic year"

/*keep only 2015/2016 accademic year */

 keep if year == "2015/2016"
 

 save Clean.Enrolment.dta
 
 
 
 
 

