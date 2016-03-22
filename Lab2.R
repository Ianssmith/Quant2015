1. List the level of measurement for each of the following variables:
  a. ID:Nominal
b. LOW:nominal
c. AGE:interval-ratio
d. LWT:interval-ratio
e. RACE:nominal
f. SMOKE:nominal
g. PTL:oridnal
h. HT:nominal
i. UI:nominal
j. FTV:interval-ratio
k. BWT:interval-ratio

2. Show a frequency table and an appropriate graph for the variable Smoking Status During Pregnancy.

freqtable(lowbwt$SMOKE)

lowbwt$SMOKE Freq ValidProp Proportion
FALSE 115 0.6084656 0.6084656
TRUE 74 0.3915344 0.3915344
N 189 1.0000000 1.0000000
NA / missing 0 NA 0.0000000
Total 189 NA 1.0000000

barplot(table(lowbwt$SMOKE))
pie(table(lowbwt$SMOKE))

Â 

3. Describe the distribution of Smoking Status During Pregnancy.

summary(lowbwt$SMOKE)
head(lowbwt)

The distribution is skewed negatively.

4. Show a frequency table and an appropriate graph for the variable Low Birth Weight.


freqtable(lowbwt$LOW)

lowbwt$LOW Freq ValidProp Proportion
FALSE 130 0.6878307 0.6878307
TRUE 59 0.3121693 0.3121693
N 189 1.0000000 1.0000000
NA / missing 0 NA 0.0000000
Total 189 NA 1.0000000

prop.table(table(lowbwt$LOW))


pie(table(lowbwt$LOW))

5. Describe the distribution of Low Birth Weight.

summary(lowbwt$SMOKE)

Mode FALSE TRUE NA's 
logical 130 59 0

Low Birthweight is negativley skewed

6. Show summary statistics and an appropriate graph for Birth Weight in Grams.

summary(lowbwt$BWT)

Min. 1st Qu. Median Mean 3rd Qu. Max. 
709 2414 2977 2945 3475 4990


7. Describe the distribution of Birth Weight in Grams.

summary(lowbwt$BWT)
The distribution appears to be a little negatively skewed, as shown by the mean being smaller than the median.
However the numerical midway point between the max and min is about 2100 which is significantly smaller than 
the median of the data this dissonance shows that for low birthweight births tend to be either significantly low
or normal but infrequently somewhere in between.

8. Show a crosstab of Low Birth Weight BY Smoking Status During Pregnancy.

prop.table(table(lowbwt$LOW, lowbwt$SMOKE), 2)

FALSE TRUE
FALSE 0.7478261 0.5945946
TRUE 0.2521739 0.4054054

9. Does there appear to be a relationship between Low Birth Weight and Smoking Status During Pregnancy? Explain.

summary(lowbwt$SMOKE)
pie(table(lowbwt$SMOKE))
freqtable(lowbwt$SMOKE)
prop.table(table(lowbwt$LOW, lowbwt$SMOKE), 2)

There does appear to be a relationship. All else being equal if you are not smoking the chances af having a low birthweight are about 25%, however if you are smoking the percentage of low birthweight births increases to about 41%