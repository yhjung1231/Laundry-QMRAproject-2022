# Laundry-QMRAproject

Project title: Evaluating infection risks and importance of hand washing during household laundry process using a QMRA approach
Author: Yoonhee Jung 

1. Parameters and distributions. R
- include all original parameters and distributions for testing baseline, handwashing 1, 2, 3, warmwater washing (E. coli), terry cotton fabric (E. coli), and line drying (E. coli) scenarios for each pathogens. 
- have to run this first 

2. Ecoli.R, Salmonella.R, Norovirus.R, Rotavirus.R, and SARS-CoV-2.R
- include codes for testing baseline scenario and handwashing 1, 2, and 3 scenarios for each microorganisms
- Each scenario follows up to the 8 events for concentration on hand, concentration on laundry, dose, risk. 

3. Result.R
- include codes for pulling out all the result to baseline scenario and handwashing scenarios (1, 2, and 3) for each pathogen as an excel file. 
- have to adjust file name before run it. 

4. baselinegraph.R
- include codes for making baselinescenrio graph for each pathogens. 
- ggplot ribbon graph

## For different washing and drying option test --------------------------------------------------------------------

5. warm wash and terry cotton.R
- include codes for testing warmwater washing cycle, the different fabric type (terry cotton instead of cotton linen), and line drying scenario for the E. coli data
- Each scenario follows up to the 8 events for concentration on hand, concentration on laundry, dose, risk.

6. E.coli option Result.R
- include codes for pulling out all the result to E.coli option test scenarios as an excel file. 
- have to adjust file name before run it.

## For improved hand hygiene (handwashing/hand sanitizer) can reduce more than 3 log reduction scenario -----------------------------

7. Parameters and distributions_hwash_impr.R
- parameters for improved hand hygiene scenario version.

8. Rotavirus_hwash_impr.R
- include codes for testing handwashing improved scenario comparing to the baseline scenario and handwashing 1, 2, and 3 scenarios for rotavirus

## Optional -------------------------------------------------------------------------------------------
9. Test.R 
- for the Mote Carlo simulation adjust iteration test 
