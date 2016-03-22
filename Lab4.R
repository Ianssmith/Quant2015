1. List the level of measurement for each of the following variables:
  
  a. LOW
Nominal

b. AGE
interval-ratio

c. the new categorical AGE variable that you created in the last assignment
ordinal

2. Conduct the appropriate hypothesis test to determine if there is a difference in age of mother
between those who had a low birth weight baby and those who did not.

a. Use variables at the appropriate level of measurement.


b. Show R syntax.
lowbwt.subset <-lowbwt[lowbwt$LOW %in% c("TRUE", "FALSE"),]
aggregate(AGE~LOW, lowbwt.subset, mean)
t.test(AGE~LOW, lowbwt.subset)

c. Show results table.
Mean
LOW AGE
1 FALSE 23.66154
2 TRUE 22.30508

Welch Two Sample t-test

data: AGE by LOW
t = 1.7737, df = 136.94, p-value = 0.07834
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  -0.1558349 2.8687423
sample estimates:
  mean in group FALSE mean in group TRUE 
23.66154 22.30508

d. Report technical results.
the p-value is 0.07834 which is more than 0.05 so there is no statistically significant
finding between the age and whether or not a mother had a baby with a low birthweight.

e. Comment on the implications of the result of the test.
This implies that there is about an 8% chance that there is no connection between 
age and birthweight at all, a percentage of chance that is generally to high for us to
assume there is a connection.


3. Conduct the appropriate hypothesis test to determine if there is a difference in the birth weight of
the baby between those who smoked during pregnancy and those who did not.

a. Use variables at the appropriate level of measurement.

b. Show R syntax.
t.test(BWT~SMOKE, lowbwt)


c. Show results table.
Welch Two Sample t-test

data: BWT by SMOKE
t = 2.7095, df = 170, p-value = 0.00743
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  76.46677 486.95979
sample estimates:
  mean in group FALSE mean in group TRUE 
3054.957 2773.243


d. Report technical results.
the p-value was 0.00743 which is significant, as it is
far below the common threshold of 0.05

e. Comment on the implications of the result of the test.
This suggests the it is highly unlikely that smoking does not effect birthweight.
The average birthweight for a smokers baby was 2773 grams vs 3054 grams for a non smoker.

4. If you wanted to conduct a two-sample hypothesis test, but both of your variables were intervalratio,
which of the following tasks would you need to complete in order to be able to conduct the test?
Select only one answer:
  
  b. Recode the independent variable into a nominal or ordinal variable.