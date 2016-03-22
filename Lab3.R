
1. List the level of measurement for each of the following variables: 
  a) LOW : Nominal

b) AGE : Interval-Ratio

2. Why is it NOT appropriate to create a crosstab using the two variables in the previous question?

A crosstab displays the joint frequency distribution of two nominal or ordinal variables since AGE is interval-ratio it would not be
applicable to this type of analysis. This is mainly because the untis with which age are measured are too small to make any
sort of categorical summation of a data set.

3. Recode the variable AGE into a new ordinal variable.

summary(lowbwt$AGE)
hist(lowbwt$AGE)
quantile(lowbwt$AGE, seq(0, 1, 0.1), na.rm=TRUE)

lowbwt$AGEcat[lowbwt$AGE <= 20]<-1
lowbwt$AGEcat[lowbwt$AGE >20 & lowbwt$AGE <= 30]<-2
lowbwt$AGEcat[lowbwt$AGE >30 & lowbwt$AGE <= 40]<-3
lowbwt$AGEcat[lowbwt$AGE >40]<-4

lowbwt$AGEcat <- factor(lowbwt$AGEcat, labels=c('20 years old or younger', '21 - 30 years old', '31 - 40 years old', 'Older than 40 years' ))

1. List the level of measurement for each of the following variables: 
a) LOW : Nominal

b) AGE : Interval-Ratio

2. Why is it NOT appropriate to create a crosstab using the two variables in the previous question?

A crosstab displays the joint frequency distribution of two nominal or ordinal variables since AGE is interval-ratio it would not be
applicable to this type of analysis. This is mainly because the untis with which age are measured are too small to make any
sort of categorical summation of a data set.

3. Recode the variable AGE into a new ordinal variable.

summary(lowbwt$AGE)
hist(lowbwt$AGE)
quantile(lowbwt$AGE, seq(0, 1, 0.1), na.rm=TRUE)

lowbwt$AGEcat[lowbwt$AGE <= 20]<-1
lowbwt$AGEcat[lowbwt$AGE >20 & lowbwt$AGE <= 30]<-2
lowbwt$AGEcat[lowbwt$AGE >30 & lowbwt$AGE <= 40]<-3
lowbwt$AGEcat[lowbwt$AGE >40]<-4

lowbwt$AGEcat <- factor(lowbwt$AGEcat, labels=c('20 years old or younger', '21 - 30 years old', '31 - 40 years old', 'Older than 40 years' ))

table(lowbwt$AGEcat, useNA="ifany")
summary(lowbwt$AGE)
tapply(lowbwt$AGE, lowbwt$AGEcat, summary)

4. Show a frequency table of the new ordinal age variable (that you created in #3) and explain your coding scheme.

freqtable(lowbwt$AGEcat)

lowbwt$AGEcat Freq ValidProp Proportion
20 years old or younger 69  0.365079365 .365079365
21 - 30 years old 100 0.529100529 0.529100529
31 - 40 years old 19 0.100529101 0.100529101
Older than 40 years 1 0.005291005 0.005291005
N 189 1.000000000                  1.000000000
NA / missing                              0            NA                     0.000000000
Tota                                     l 189            NA                     1.000000000

I decided to recode the variables in the above categories to illustrate the power of how you categorize data. 
By dividing the two largest sample populations in half this way it gives a clearer picture of the distribution of the sample aged over 20, 
but in a way obfuscates the drastic difference between the age groups below 15 and in between 15 and 20. While it is never good to make assumptions about your reader, and there may be valuable insight within the difference between the 15-20 range and the <15 range, since we are recoding the entire sample population, and the legal age of consent (and consequently the theoretical possibility of pregnancy) is over 18, it may be misleading, or at least off topic to divide the sample to include a category of 15 and under.

5. Show a crosstab of Low Birth Weight BY Age of Mother, making sure to use variables at the appropriate levels of measurement.

prop.table(table(lowbwt$LOW, lowbwt$AGEcat),2) 
              20 years old or younger      21 - 30 years old        31 - 40 years old        Older than 40 years
FALSE   0.6666667                           0.6700000                  0.8421053                1.0000000
TRUE    0.3333333                            0.3300000                  0.1578947                0.0000000

6. Does there appear to be a relationship between Low Birth Weight and Age of Mother? Explain.

It appears that before age 30 there is about a 33% chance 
having a baby with a low birthweight, after age 30 this figure drops to about 16%










