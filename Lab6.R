1. Conduct the appropriate hypothesis test to determine if there is a difference in the rate of those
who smoke while pregnant, by race.

a. Use variables at the appropriate level of measurement.
Variables SMOKE and RACE are of appropriate level for the Chi Square Test

b. Show R syntax.
table(lowbwt$SMOKE, lowbwt$RACE)
prop.table(table(lowbwt$SMOKE, lowbwt$RACE), 2)
chisq.test(table(lowbwt$SMOKE, lowbwt$RACE), correct=FALSE)

c. Show results tables.

  white black other
FALSE   44  16  55
TRUE  52  10  12

white   black   other
FALSE 0.4583333   0.6153846   0.8208955
TRUE 0.5416667   0.3846154  0.1791045


Pearson's Chi-squared test

data: table(lowbwt$SMOKE, lowbwt$RACE)
X-squared = 21.779, df = 2, p-value = 1.865e-05


d. Report technical results.

the percentage of women smoking during pregnency varied by race
X-squared = 21.779, df = 2, p-value < 0.001 | p-value = 1.865e-05 
We will reject the Null Hypothesis


e. In one paragraph, comment on the implications of the result of the test. Make
observations. Speculate.

According to the calculations there is a statistically significant difference between 
a mothers race and whether or not she smoked during pregnency. We have rejected a Null Hypothesis. Since there isÂ this difference we can surmise that White mothers have a higher tendency to smoke while pregnant than any other race. While the sample size of White mothers was much larger than for other races, the difference in the ratios of mothers who smoked vs mothers who didn't within race categories was large enough to suggest there is indeed a difference, subsequently the Chi-square test confirmed this significance.

2. If you wanted to conduct a Chi-Square hypothesis test, but both of your variables were interval-ratio, which of the following tasks would you need to complete in order to be able to conduct the
test? Select only one answer:


c. Recode both the dependent and independent variables into nominal or ordinal variables.
