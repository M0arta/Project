/* merge instat datset with the list of regions where each region is associated with the university name. In this way it is possible to merge then the Istat dataset with the one that contains the number of enrolled student in each university that can be used as a control in further regressions*/ 

use Clean_Istat.dta 

sort reg_uni

merge m:m reg_uni using Clean_region.dta

save Merged.dta

clear 

use Clear_Enrolment.dta

lab var uni_name "University Name/city location"
rename uni_name city_uni

save Clear_Enrolment.dta, replace

merge m:m city_uni using Clean_Enrolment.dta, generate(_merge_enrl)

save Merged_02.dta


/*The merging is very loose, the name of the Univerities do not corresponds exactly to the city name but for almost the half of the sample the merging works */




