nrow(country)
head(country)
1. List the level of measurement for each of the following variables:
  
  a. country: NOMINAL
b. hdirank: interval
c. hdicat: ordinal
d. pop2004: ratio
e. URBAN: interval
f. physicians: ratio
g. mort2004: ratio
h. tele2004: ratio
i. cell2003: ratio
j. internet03: ratio
k. gdp: ratio
l. inequality: interval
m. educ04: interval
n. milit2004: interval
o. debt04: interval
p. cde2003: ratio
q. lifef: interval
r. lifem: interval

2. What is the average infant mortality rate (per 1,000 births) in 2004?

mean = 41.74


3. What is the maximum infant mortality rate (per 1,000 births) in 2004?

Max = 165

4. What is the median for cell phones per 1,000 people in 2003?

Median = 289

5. What is the 95th percentile for cell phones per 1,000 people in 2003?

95% = 996.2

6. Compare the median and 95th percentile for cell phones per 1,000 people in 2003. What does
this comparison tell you about the distribution of this variable?

This data set is negatively skewed toward higher amounts meaning 
countries tended to have a higher amount of cell phones per 1000 people 
but did not seem to have a concentration around a single specific amount.
This is evident because the median is only about a third of the 95th percentile. 
since the 95th percentile is relatively close to the max I would assume the median 
would be closer to 50% of the 95th percentile if the distrubution was relativley normal.
(For some reason when I got home and attempted 
to us the descriptive statstics functions many
of them did not seem to work unless I typed na.rm = TRUE as an extra parameter.
What is the function of this parameter?)

7. Describe hdicat. Use descriptive statistics, if appropriate.

hidcat is the level of development of a country categorized by low medium and high.
According to the table of this data it appears that the distribution is negativley skewed 
toward the "higher" spectrum of development.

8. Describe hdirank. Use descriptive statistics, if appropriate.

hdiRank is the countries ranked from lowest to highest in terms of development in an interval fashion.

9. Did you describe hdicat and hdirank differently? Why or why not? What does each description
tell you? How do these variables relate to each other?

Yes I described them differently, because even though they both describe the 
same data in the same way (ranked from highest to lowest) hdicat achieves a 
more insightful picture of the distribution of countries development globally 
by dividing the interval data into ordinal categories.


10. Why is it important to use Frequency Tables for nominal and ordinal variables and other
descriptive statistics for interval- ratio variables?

Since nominal and ordinal variables have qualitative vs quantitative measurments
the best way to glean meaning from their distribution is to analyze how frequently
they occur in a data set.
On the other hand for interval-ratio variables it is likely that each (or at least
                                                                       many) instance of data will have its own unique value so to orgainize them in terms of 
how frequently each occored would be no better than listing them all in order.
Finding their average and their standard deviation however can provide a single value
giving a snapshot of the the data as a whole.

R commands used::
  
  summary(country$hidrank)
summary(country$mort2004)
summary(country$cell2003)
quantile(country$cell2003, 0.95, na.rm=TRUE)
quantile(country$cell2003, seq(0,1, 0.1), na.rm=TRUE)
range(country$cell2003, na.rm = TRUE)
var(country$cell2003, na.rm = TRUE)
sd(country$cell2003, na.rm = TRUE)
IQR(country$cell2003, na.rm = TRUE)
getmode(country$cell2003)
freqtable(country$cell2003)
summary(country$hidcat)
table(country$hdicat)
freqtable(country$hdicat)
summary(country$hdirank)
table(country$hdirank)
class(country$hdirank)
freqtable(country$hdirank)

Â 