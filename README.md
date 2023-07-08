# Laundry-QMRAproject
AJIC, Published (2023) 
https://doi.org/10.1016/j.ajic.2023.05.017

Project title: Evaluating infection risks and importance of hand washing during household laundry process using a QMRA approach

Yoonhee Jung,1* Sarah E. Abney,2 Kelly A. Reynolds,1 Charles P. Gerba,3 Amanda M. Wilson1

1. Department of Community, Environment & Policy, Mel and Enid Zuckerman College of
Public Health, University of Arizona, AZ, USA
2. García-Robles Fulbright Program, Centro de Investigación Científica de Yucatán,
Yucatán, México
3. Department of Environmental Science, College of Agriculture and Life Sciences,
University of Arizona, AZ, USA

------------------------------------------------------------------------------------------------

1. Parameters and distributions. R
- include all original parameters and distributions for testing baseline, handwashing 1, 2, 3, warmwater washing (E. coli), terry cotton fabric (E. coli), and line drying (E. coli) scenarios for each pathogens. 
- have to run this first 

2. Ecoli.R, Salmonella.R, Norovirus.R, Rotavirus.R, and SARS-CoV-2.R
- include codes for testing baseline scenario and handwashing 1, 2, and 3 scenarios for each microorganisms
- Each scenario follows up to the 8 events for concentration on hand, concentration on laundry, dose, risk. 

3. Result.R
- include codes for pulling out all the result to baseline scenario and handwashing scenarios (1, 2, and 3) for each pathogen as an excel file. 
- have to adjust file name before run it. 

## For different washing and drying option test ---------------------------------------------------

4. warm wash and terry cotton.R
- for running this different washing and drying option test, you need to run Parameters and distributions. R first. (in step 1)
- include codes for testing warmwater washing cycle, the different fabric type (terry cotton instead of cotton linen), and line drying scenario for the E. coli data
- Each scenario follows up to the 8 events for concentration on hand, concentration on laundry, dose, risk.

5. E.coli option Result.R
- include codes for pulling out all the result to E.coli option test scenarios as an excel file. 
- have to adjust file name before run it.

## For improved hand hygiene (handwashing/hand sanitizer can reduce more than 3 log reduction) scenario -----------------------------

6. Parameters and distributions_hwash_impr.R
- parameters for improved hand hygiene scenario version.

7. Rotavirus_hwash_impr.R
- include codes for testing handwashing improved scenario comparing to the baseline scenario and handwashing 1, 2, and 3 scenarios for rotavirus

## Optional -------------------------------------------------------------------------------------------

8. baselinegraph.R
- This file was used for making a baselinegraph(riboon plot) using ggplot2.
- I used baseline_dose.csv and baseline scenario result graph.csv for making a graph. 
- You can make your own graph using the result you got from the process above (step 1-3)

9. Test.R 
- for the Mote Carlo simulation adjust iteration test 
