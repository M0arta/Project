/home/marta/Coding_Project/Data/Raw

import delimited SN189.dat

/*keep only students that graduated in Italy */

keep if l1_2 == 1

/*generate proper sex dummy */

gen sex = 1 if sesso == 2 

replace sex = 0 if sesso == 1

drop sesso  


/* rename and label variables of interest */ 

rename l1_22 grade

lab var grade "graduation mark"

rename eta_lau age_grad

lab var age_grad "age_group"

rename l1_15 class_att 

lab var class_att "Frequence of class attendence (1-3) "

lab var sex "Gender dummy, 1 if Female"

rename l1_17 EU_mobility

lab var EU_mobility "Dummy for partecipation to a EU mobiiliy program"

rename citt_mfr citizenship

lab var citizenship "Dummy for having an Italian citizenship"

rename l2_1 work 

lab var work "Dummy for working situation"

rename l5_4 father_edu

lab var father_edu "Level of education of father"

rename l5_9 mother_edu

lab var mother_edu "Level of education of mother"

rename reddito income

lab var income "Total income after graduation"

/* Explore info on university location to prepare for the merging with the other dataset */

codebook reg_uni

replace reg_uni = 0 if (reg_uni == .)

tab reg_uni 

drop if reg_uni == 0

tab reg_uni

/*generate average for parents level of education*/

gen p_edu = (mother_edu + father_edu)/2

lab var p_edu "Mean of parent's education"

/* Explore info on university location to prepare for the merging with the other dataset */

codebook reg_uni

replace reg_uni = 0 if (reg_uni == .)

tab reg_uni 

drop if reg_uni == 0

tab reg_uni


/* keep only variables of interest */

keep sex grade age_grad class_att citizenship reg_uni EU_mobility work p_edu reg_uni income

