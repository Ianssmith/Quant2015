
Part I. Hypothesis Testing

The following questions involve hypothesis tests: that is, T-tests, ANOVA, or Chi Square (we will not
                                                                                          use regression in this section). You must identify which technique is appropriate for each question. Use
the hypothesis testing guidelines to determine which test is the most appropriate. Answer in a short
paragraph, making sure to address each question. Compile your supporting R code and submit in a
comprehensive block in Part III, R code.
*When examining salary in this section use the current salary variable

1. Looking at salary and minority status


a. What is the average salary for nonminorities at this corporation?
salary = interval ratio
minority= nominal
summary(empdat$salary)

Min. 1st Qu. Median Mean 3rd Qu. Max. 
15750 24000 28880 34420 36940 135000 

t.test(salary~minority, empdat)

## mean in group "No" : 36023.31 

b. What is the average salary for minorities?
"
## mean in group "Yes" : 28713.94


c. Comment on your findings. Report the medians as well.

tapply(empdat$salary, empdat$minority, summary)

$No
Min. 1st Qu. Median Mean 3rd Qu. Max. 
15750 24150 29920 36020 40310 135000

$Yes
Min. 1st Qu. Median Mean 3rd Qu. Max. 
16350 23660 26620 28710 30640 100000

##The Minority group mean value is sitting right below the sample median while
the Non-minority group mean is about $2,000 in salary below the entire sample mean.
The disparity between the mediam and mean of the sample suggest a positively skewed distribution 
across the entire sample, however since the minorities group mean is roughly equivalent to
the median while the non-minority mean is higher and also accounting for a much larger percentage of the sample N
this suggests the positive skew may only be occuring within the non-minority group.
Let's find out:

sd(empdat$salary)
17075.66
IQR(empdat$salary)
12937.5

##according to the standard deviation we have some outliers which
lie almost 6 standard deviation away from the mean.


hist(empdat$salary)
quantile(empdat$salary, seq(0, 1, 0.25), na.rm=TRUE)

0%                  25%           50%          75%       100% 
15750.0      24000.0      28875.0      36937.5      135000.0

##The entire sample mean is sitting at right below the 75th quantile.
##Lets seperate the distrobution into quarter categories:


empdat$salaryCat[empdat$salary <= 24000] <-1
empdat$salaryCat[empdat$salary > 24000 & empdat$salary <= 28875] <-2
empdat$salaryCat[empdat$salary > 28875 & empdat$salary <= 36937] <-3
empdat$salaryCat[empdat$salary >36937 & empdat$salary <=135000] <-4

empdat$salaryCat <- factor(empdat$salaryCat, labels=c('Low:<=$24,000', 'Mid-low:>$24,000/<=$28,875', 'Mid-high:>$28,875/<=$36,937', 'High:>$36,937/<=$135,000'))

summary(empdat$salaryCat)
tapply(empdat$salary, empdat$salaryCat, summary)

## The number of samples seems to be evenly distributed across the quantiles over all.
## However the 4th quantile spans a much larger amount of salary (nearly $100K) while the other
quantiles span between $4-8K. 
##The difference in means between the different quantiles are of a similar 
magnitude of difference in incrememntal value, however the
positive skewness is no longer present in the first 3 quantiles however is still detectable in the 4th.
More noticable is that both the median and mean sit
well below the median of the salary range of the 4th quantile Likely caused by the outliers I mentioned earlier.

Low:<=$24,000 Mid-low:>$24,000/<=$28,875 Mid-high:>$28,875/<=$36,937 High:>$36,937/<=$135,000 
120 117 118 119

table(empdat$salaryCat, empdat$minority)

No Yes
Low:<=$24,000 90 30
Mid-low:>$24,000/<=$28,875 78 39
Mid-high:>$28,875/<=$36,937 91 27
High:>$36,937/<=$135,000 111 8

##It looks like the samples identified as Non-minority have a much larger number of cases falling into the 
"High"" category vs the minority group. Let's check what those percentages are 
and what their respective distrobution graph looks like:


empdat$salary.minority[empdat$salary <= 24000 & empdat$minority == 'Yes'] <-1
empdat$salary.minority[empdat$salary > 24000 & empdat$salary <= 28875 & empdat$minority == 'Yes'] <-2
empdat$salary.minority[empdat$salary > 28875 & empdat$salary <= 36937 & empdat$minority == 'Yes'] <-3
empdat$salary.minority[empdat$salary >36937 & empdat$salary <=135000 & empdat$minority == 'Yes'] <-4


summary(empdat$salary.minority)
Min. 1st Qu. Median Mean 3rd Qu. Max. 
1.000 1.000 2.000 2.125 3.000 4.000

hist(empdat$salary.minority)


freqtable(empdat$salary.minority)

          Freq         ValidProp       Proportion
1         30           0.28846154    0.06329114
2        39          0.37500000      0.08227848
3        27           0.25961538      0.05696203
4        8            0.07692308     0.01687764
N        104        1.00000000      0.21940928

prop.table(table(empdat$salary.minority))

grouped sample:
1                                2                      3                      4 
0.28846154       0.37500000        0.25961538     0.07692308 
~~ 28%                    37%                 26%                7%

entire sample:

1                                   2                             3                       4 
0.06329114         0.08227848          0.05696203        0.01687764 
~~ 6%                        8%                            5%                  1%

hist(empdat$salary.minority)

## we can see from the histogram that the distorbution of the minority group roughly follows the
distrobution of the sample as a whole.

empdat$salary.Nonminority[empdat$salary <= 24000 & empdat$minority == 'No'] <-1
empdat$salary.Nonminority[empdat$salary > 24000 & empdat$salary <= 28875 & empdat$minority == 'No'] <-2
empdat$salary.Nonminority[empdat$salary > 28875 & empdat$salary <= 36937 & empdat$minority == 'No'] <-3
empdat$salary.Nonminority[empdat$salary >36937 & empdat$salary <=135000 & empdat$minority == 'No'] <-4

hist(empdat$salary.Nonminority)
summary(empdat$salary.Nonminority)
Min. 1st Qu. Median Mean 3rd Qu. Max. 
1.000 2.000 3.000 2.603 4.000 4.000 

freqtable(empdat$salary.Nonminority)
Freq ValidProp Proportion
1 90 0.2432432 0.1898734
2 78 0.2108108 0.1645570
3 91 0.2459459 0.1919831
4 111 0.3000000 0.2341772
N 370 1.0000000 0.7805907

prop.table(table(empdat$salary.Nonminority))

1                                    2                3                    4 
0.2432432     0.2108108      0.2459459       0.3000000 
~~24%                 21%                  23%                30%

hist(empdat$salary.Nonminority)

## the histogram of this group shows that the distrobution very different from the
distrobution of the entire sample despite accoutning for nearly 80% of the sample N.


d. Perform the appropriate hypothesis test to determine whether the difference is statistically
significant.

Welch Two Sample t-test

data: salary by minority
t = 5.0032, df = 262.19, p-value = 1.034e-06
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
4432.707 10186.030
sample estimates:
mean in group No mean in group Yes 
36023.31 28713.94

According to the p-value of .00001 the difference is statistically significant,
with minorities having a lower salary than non-minorities

2. Looking at salary and gender

summary(empdat$salary)
Min. 1st Qu. Median Mean 3rd Qu. Max. 
15750 24000 28880 34420 36940 135000 
summary(empdat$gender)
Female  Male 
216       258

a. What is the average salary for men at this corporation?
t.test(salary~gender, empdat)
Mean in group Male: $41441.78

b. What is the average salary for women at this corporation?
mean in group Female: $26031.92

c. Comment of your findings. 
tapply(empdat$salary, empdat$gender, summary)
$Female
Min. 1st Qu. Median Mean 3rd Qu. Max. 
15750 21560 24300 26030 28500 58120

$Male
Min. 1st Qu. Median Mean 3rd Qu. Max. 
19650 28050 32850 41440 50410 135000

##Males and Female median values fall about $4,000 above and below the group median respectively;
even the Female mean value falls below the groups median value. The range of the Female salaries is also
much smaller than for Male both starting at a lower minimum and stopping at a much smaller maximum than for Male.

d. Perform the appropriate hypothesis test to determine whether the difference is statistically
significant.
t.test(salary~gender, empdat)

Welch Two Sample t-test

data: salary by gender
t = -11.688, df = 344.26, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
-18003.00 -12816.73
sample estimates:
mean in group Female mean in group Male 
26031.92 41441.78

## according to the p-value of < 2.2e-16 the difference between 
salary of Male and Female is statistically significant, with Females earning less than Males

3. Looking at job category and gender
summary(empdat$jobcat)
summary(empdat$gender)

a. What is the association between job category and gender at this corporation?
>table(empdat$jobcat, empdat$gender)

Female Male
Clerical 206 157
Custodial 0 27
Manager 10 74

prop.table(table(empdat$jobcat,empdat$gender),2)

Female Male
Clerical 0.9537037 0.6085271
Custodial 0.0000000 0.1046512
Manager 0.0462963 0.28682176

95% of of female employees are Clerical and only 4% are managers none are custodial, for male 
60% are clerical and 28% are manager and 10% are custodial
2800/32 = 87.5
6100/155
This means about 87% of Manager employees are male but only 39% of clerical workers are Male

b. Perform the appropriate statistical test to determine whether the difference is statistically significant.
chisq.test(table(empdat$gender, empdat$jobcat), correct=FALSE)
Pearson's Chi-squared test

data: table(empdat$gender, empdat$jobcat)
X-squared = 79.277, df = 2, p-value < 2.2e-16

According to the p-value of < .05 the difference is statistically significant

c. Comment on your findings.

Not only are the majority of clerical workers female but generally female employees 
at this company hold almost exclusively clerical positions with only 10 of the 216 females 
in the sample holding a position other than clerical.

4. Looking at job category and minority status
table(empdat$jobcat, empdat$minority)


a. What is the association between job category and minority status at this corporation?
prop.table(table(empdat$jobcat, empdat$minority),2)

No Yes
Clerical 0.74594595 0.83653846
Custodial 0.03783784 0.12500000
Manager 0.21621622 0.03846154

A much larger percentage of non-minority employees hold manager jobs than minority employees.
about 21% of non-minority are managers whole only about 4% of minority employees are managers.

b. Perform the appropriate statistical test to determine whether the difference is statistically significant.
c. Comment on your findings.

chisq.test(empdat$jobcat, empdat$minority)
There is a statistically significant difference between minority vs non-minority employees 
and what job category they fill; minority employees fill non-managerial employees at a .95 ratio
while non-minorities have a ratio of 0.78 filling non-manager roles.

5. Looking at salary and job category
aggregate(empdat$salary~empdat$jobcat, empdat, mean)
empdat$jobcat empdat$salary
1 Clerical 27838.54
2 Custodial 30938.89
3 Manager 63977.80

a. What are the salary differences by job category at this corporation?

1 Clerical 27838.54
2 Custodial 30938.89
3 Manager 63977.80

b. Perform the appropriate statistical test to determine whether the difference is statistically significant.
anova.JobSalary <-aov(empdat$salary~empdat$jobcat, empdat)
summary(anova.JobSalary)

Df Sum Sq Mean Sq F value Pr(>F) 
empdat$jobcat 2 8.944e+10 4.472e+10 434.5 <2e-16 ***
  Residuals 471 4.848e+10 1.029e+08 
---
  Signif. codes: 0 ˜*** 0.001 ˜** 0.01 ˜* 0.05 ˜. 0.1 ˜  1

The difference between the job categories is statistically significant
since the Pr(>F) is less than 0.05, Managers make a significantly higher salary than other job categories

c. Comment on your findings.
The amount of employees in a given category appears to have an inverse relationship to salary.


6. Looking at minority status and gender
a. What is the association between minority status and gender at this corporation?
table(empdat$minority, empdat$gender)
Female Male
No 176 194
Yes 40 64

prop.table(table(empdat$minority, empdat$gender), 2)

Female Male
No 0.8148148 0.7519380
Yes 0.1851852 0.2480620

There are a higher number of males and non-minorities at this company, there does not seem 
to be any association

b. Perform the appropriate statistical test to determine whether the difference is statistically significant.

chisq.test(table(empdat$minority, empdat$gender), correct=FALSE)
Pearson's Chi-squared test

data: table(empdat$minority, empdat$gender)
X-squared = 2.7139, df = 1, p-value = 0.09948

c. Comment on your findings.

we found that there is no statistical difference whether employees are minority or non-minority 
when considered with whether the employee was female or male.

7. Synthesizing results (answer in one paragraph)

 

a. Based on descriptive statistics and hypothesis tests above, does there appear to be discrimination by race and gender?

b. Why do you need regression analysis to confirm this?

Based solely on the descriptve statistics and test above I would not be confident
in saying that there was descrimination by race or gender, we discovered that although
there was a distinct and strong statistically significant difference between the salary of
males and females and also minorities and non-minorites, we also established there was a 
distinct and strong statistically significant difference between job categories with larger
ratios of both women and minorities filling clerical and custodial jobs which pay significantly
less than managerial roles. In order to better define if there is indeed discrimination by race
and gender we would need to control for additinal variables accross the ones we analyzed above.
Firstly we would need to run a regression to check if there was a statistically significant
difference in salary between males and females who were ALSO both Managers and between males
and females who were also both clerical employees, and the same for minority vs non-minority
It would also be prudent to check additional variables such as level of education, work 
experience, age etc. to see if the disparity in salary is or is not explained or influenced 
by other factors.

 

 

Part II. Regression & Interpretation

The following section involves regression: that is, simple and multiple linear regression. Reference Labs
7-8 to guide your syntax for the following questions. You will write the code, and run it in your R
environment. Compile your supporting R code and submit in a comprehensive block in Part III, R code.
Include interpretation, description of results, and answers to short answer question below. The following
looks at critically at minority status in relation to current salary. Through regression, you will determine
whether the corporation is in fact guilty of discrimination.

1. Minority status regression


a. Regress beginning salary on minority status.
beginsalminority.regression <- lm(empdat$salbegin ~ empdat$minority)
summary(beginsalminority.regression)

Call:
lm(formula = empdat$salbegin ~ empdat$minority)

Residuals:
Min 1Q Median 3Q Max 
-7923 -4286 -1923 1071 62307

Coefficients:
Estimate Std. Error t value Pr(>|t|) 
(Intercept) 17673.0 404.5 43.692 < 2e-16 ***
empdat$minorityYes -2994.1 863.5 -3.467 0.000574 ***
---
Signif. codes: 0 ˜*** 0.001 ˜** 0.01 ˜* 0.05 ˜. 0.1 ˜  1

Residual standard error: 7781 on 472 degrees of freedom
Multiple R-squared: 0.02484, Adjusted R-squared: 0.02277 
F-statistic: 12.02 on 1 and 472 DF, p-value: 0.000574

b. Regress current salary on minority status.
currentsalminority.regression <- lm(empdat$salary ~ empdat$minority)
summary(currentsalminority.regression)

Call:
lm(formula = empdat$salary ~ empdat$minority)

Residuals:
Min 1Q Median 3Q Max 
-20273 -10636 -4714 2827 98977

Coefficients:
Estimate Std. Error t value Pr(>|t|) 
(Intercept) 36023.3 874.6 41.189 < 2e-16 ***
empdat$minorityYes -7309.4 1867.1 -3.915 0.000104 ***
---
Signif. codes: 0 ˜*** 0.001 ˜** 0.01 ˜* 0.05 ˜. 0.1 ˜  1

Residual standard error: 16820 on 472 degrees of freedom
Multiple R-squared: 0.03145, Adjusted R-squared: 0.0294 
F-statistic: 15.33 on 1 and 472 DF, p-value: 0.0001038

c. Describe the results in a paragraph.

There was a statistically significant difference according to the regression for those who were minorities would deduct an amount of
-2994.1 from their beginning salary to make an accurate estimate compared to ther non-minority counterparts


There was a statistically significant difference according to the regression for those who were minorities would deduct an amount of
-7309.4 from their salary to make an accurate estimate compared to ther non-minority counterparts

 

2. Current salary regression


a. Using multiple linear regression, determine the current salary difference between
minorities and nonminorities, controlling for the following:

salary.regression <- lm(empdat$salary ~ empdat$minority + empdat$educ + empdat$age + empdat$jobtime + empdat$age + empdat$prevexp + empdat$jobcat + empdat$Female)
summary(salary.regression)


i. education
ii. type of job (use both dummy variables)
empdat$jobcler <- (empdat$jobcat == "Clerical")
empdat$jobcler <- (empdat$jobcat == "Custodial")

iii. age

iv. gender (use a female dummy variable)

empdat$genderfem <- (empdat$jobcat == "Female")


v. time in current job
vi. previous experience


b. Follow the R syntax using the multiple.regression function, followed by a summary of
the regression covered in Lab 7-8. Follow the example below using current salary from
the empdat dataframe and all (quantitative) independent variables (do not include
nominal variables). Make sure to use the proper level of measurement.


Call:
lm(formula = empdat$salary ~ empdat$minority + empdat$educ + 
empdat$jobcat + empdat$age + empdat$jobtime + empdat$age + 
empdat$prevexp + empdat$jobcler + empdat$Female)

Residuals:
Min 1Q Median 3Q Max 
-23335 -4292 -772 3356 67185

Coefficients: (1 not defined because of singularities)
Estimate Std. Error t value Pr(>|t|) 
(Intercept) 5974.850 4533.655 1.318 0.18819 
empdat$minorityYes -2074.889 1030.636 -2.013 0.04467 * 
empdat$educ 1391.431 200.694 6.933 1.39e-11 ***
empdat$jobcatCustodial 5603.159 2147.514 2.609 0.00937 ** 
empdat$jobcatManager 27047.354 1396.247 19.371 < 2e-16 ***
empdat$age -18.165 62.720 -0.290 0.77224 
empdat$jobtime 107.445 41.394 2.596 0.00974 ** 
empdat$prevexp -5.737 7.553 -0.760 0.44788 
empdat$FemaleTRUE -5612.238 1006.647 -5.575 4.20e-08 ***
---
Signif. codes: 0 ˜*** 0.001 ˜** 0.01 ˜* 0.05 ˜. 0.1 ˜  1

Residual standard error: 8931 on 464 degrees of freedom
(1 observation deleted due to missingness)
Multiple R-squared: 0.7316, Adjusted R-squared: 0.727 
F-statistic: 158.1 on 8 and 464 DF, p-value: < 2.2e-16

c. Interpreting the regression


i. Report the F statistic, R2, P values.
-The F-statistic is 158.1 on 8 and 464 DF
-the R2 is 0.7316 (0.727 adjusted) so this model should explain about 73% of the variance in salary
-The P-valuefor the model is <2.2e-16 indicating since it is less than
the desired confidence interval of 0.05 that the model is significant

 

ii. Write the multiple regression equation.


(Intercept) 5974.850 
empdat$minorityYes -2074.889 (inclued if minority) 
empdat$educ 3443.42 (x #years) 
empdat$jobcatCustodial 8353.778 (include if custodial) 
empdat$jobcatManager 28203.786 (include if manager) 
empdat$age 114.97 (x #years) 
empdat$jobtime 67.05 (x #years) 
empdat$prevexp -13.9 (x #years)
+_______________________
estimated Salary =


d. Interpret the model in a few paragraphs. Interpret all statistics and indicate the
implications of the model.

The strongest indicators of salary are job category followed by education, as
for each addionatl year+ of education an employee has his salary could be estimated to increase about $1,391
for jab category the difference between being a manager and clerical role about gives you an estimated increase in 
your salary of about 5 times what it would be as clerical. The variation in salary caused by jobtime is significant 
however only causing a relatively small increase in salary per year. The model calculates that minority status and being female
both are statistically significant explanations of variance in their own right causing a decrease 
in salary estimation by $2,074 if you are a minority in this company and by $5,162 if you are a female. 
In particular the statistical significance of the variation in salary explained by gender is very strong
This implies that this company is discriminating against females and minotiry groups when it comes to salary.

 

i. Report whether the model is statistically significant.
The model returning a p-value of 2.2e-16; Less than 0.05 is statistically significant.

ii. Report which of the independent variables are statistically significant.
1.Job Category
2.Education 
3.Female
4.Job time
5.monitority status


iii. Interpret and describe the multiple regression equation.

3. Summarize your conclusions.

The research indacates that the difference in salary caused by gender
or minority status is significant enough for us to assume the
company is paying lower salaries to women or minorities in
a discrimitory way, this after comparing these variables to others which may influence salary


a. Elaborate on your findings. What do the results say about the relationship between
minority status and current salary? Gender and current salary?

The relationship between minority satus and salary shows that minority status is a significant 
variable for explaining a decrease in salary of about $2000 if you are a minority, according to our regression. The same can 
be said for the relationship between gender and salary if you are a female, however the significance of this relationship is much stronger 
than for minority status and the decrease estimated is larger of about $5,500.


b. Is the corporation guilty of paying minorities a lower salary when controlling for other
variables?

Yes


4. Why regression?


a. Why didnt we just conduct a t-test to address this research question?
A single t-test cannot handle multiple independent variables or cross check the influence of multiple variables across

b. Is multiple regression better or worse for this analysis? Why or why not?

Multiple regression is better for analysis because you are able to 
compare the influence of multiple different variables upon the dependent
variable of salary, allowing you to check the importance of each of the variables when
it comes to the variation of the dependant variable.

 

 

Part III. R Code


1. Include your supporting R code for Parts I & II written in proper syntax here. For full credit, code must run without error. Include comments in your code so it is easy to follow, noting what question you are answering.


Part I. Hypothesis Testing

 

##1. Looking at salary and minority status


##a. What is the average salary for nonminorities at this corporation?
salary = interval ratio
minority= nominal
summary(empdat$salary)


t.test(salary~minority, empdat)


##b. What is the average salary for minorities?


##c. Comment on your findings. Report the medians as well.

tapply(empdat$salary, empdat$minority, summary)

 

 

sd(empdat$salary)

IQR(empdat$salary)


hist(empdat$salary)
quantile(empdat$salary, seq(0, 1, 0.25), na.rm=TRUE)

 


empdat$salaryCat[empdat$salary <= 24000] <-1
empdat$salaryCat[empdat$salary > 24000 & empdat$salary <= 28875] <-2
empdat$salaryCat[empdat$salary > 28875 & empdat$salary <= 36937] <-3
empdat$salaryCat[empdat$salary >36937 & empdat$salary <=135000] <-4

empdat$salaryCat <- factor(empdat$salaryCat, labels=c('Low:<=$24,000', 'Mid-low:>$24,000/<=$28,875', 'Mid-high:>$28,875/<=$36,937', 'High:>$36,937/<=$135,000'))

summary(empdat$salaryCat)
tapply(empdat$salary, empdat$salaryCat, summary)

 

 

table(empdat$salaryCat, empdat$minority)

 


empdat$salary.minority[empdat$salary <= 24000 & empdat$minority == 'Yes'] <-1
empdat$salary.minority[empdat$salary > 24000 & empdat$salary <= 28875 & empdat$minority == 'Yes'] <-2
empdat$salary.minority[empdat$salary > 28875 & empdat$salary <= 36937 & empdat$minority == 'Yes'] <-3
empdat$salary.minority[empdat$salary >36937 & empdat$salary <=135000 & empdat$minority == 'Yes'] <-4


summary(empdat$salary.minority)


hist(empdat$salary.minority)


freqtable(empdat$salary.minority)


prop.table(table(empdat$salary.minority))



hist(empdat$salary.minority)

 

empdat$salary.Nonminority[empdat$salary <= 24000 & empdat$minority == 'No'] <-1
empdat$salary.Nonminority[empdat$salary > 24000 & empdat$salary <= 28875 & empdat$minority == 'No'] <-2
empdat$salary.Nonminority[empdat$salary > 28875 & empdat$salary <= 36937 & empdat$minority == 'No'] <-3
empdat$salary.Nonminority[empdat$salary >36937 & empdat$salary <=135000 & empdat$minority == 'No'] <-4

hist(empdat$salary.Nonminority)
summary(empdat$salary.Nonminority)


freqtable(empdat$salary.Nonminority)
Freq ValidProp Proportion


prop.table(table(empdat$salary.Nonminority))



hist(empdat$salary.Nonminority)


##d. Perform the appropriate hypothesis test to determine whether the difference is statistically
##significant.

t.test(salary~minority, empdat)

 

##2. Looking at salary and gender

summary(empdat$salary)

summary(empdat$gender)


##a. What is the average salary for men at this corporation?
t.test(salary~gender, empdat)


##b. What is the average salary for women at this corporation?


##c. Comment of your findings. 
tapply(empdat$salary, empdat$gender, summary)

 

##d. Perform the appropriate hypothesis test to determine whether the difference is statistically
##significant.
t.test(salary~gender, empdat)

 

##3. Looking at job category and gender
summary(empdat$jobcat)
summary(empdat$gender)

##a. What is the association between job category and gender at this corporation?
table(empdat$jobcat, empdat$gender)

 

prop.table(table(empdat$jobcat,empdat$gender),2)

 

##b. Perform the appropriate statistical test to determine whether the difference is statistically ##significant.
chisq.test(table(empdat$gender, empdat$jobcat), correct=FALSE)

##c. Comment on your findings.

 

##4. Looking at job category and minority status
table(empdat$jobcat, empdat$minority)


##a. What is the association between job category and minority status at this corporation?
prop.table(table(empdat$jobcat, empdat$minority),2)

 

##b. Perform the appropriate statistical test to determine whether the difference is statistically ##significant.
##c. Comment on your findings.

chisq.test(empdat$jobcat, empdat$minority)


##5. Looking at salary and job category
aggregate(empdat$salary~empdat$jobcat, empdat, mean)
empdat$jobcat empdat$salary


##a. What are the salary differences by job category at this corporation?

 

##b. Perform the appropriate statistical test to determine whether the difference is statistically ##significant.
anova.JobSalary <-aov(empdat$salary~empdat$jobcat, empdat)
summary(anova.JobSalary)

 

##c. Comment on your findings.



##6. Looking at minority status and gender
##a. What is the association between minority status and gender at this corporation?
table(empdat$minority, empdat$gender)


prop.table(table(empdat$minority, empdat$gender), 2)

 

##b. Perform the appropriate statistical test to determine whether the difference is statistically significant.

chisq.test(table(empdat$minority, empdat$gender), correct=FALSE)

##c. Comment on your findings.

 

##7. Synthesizing results (answer in one paragraph)

 

##a. Based on descriptive statistics and hypothesis tests above, does there appear to be ##discrimination by race and gender?

##b. Why do you need regression analysis to confirm this?

 

 

 

##Part II. Regression & Interpretation

 

##1. Minority status regression


##a. Regress beginning salary on minority status.
beginsalminority.regression <- lm(empdat$salbegin ~ empdat$minority)
summary(beginsalminority.regression)

 

##b. Regress current salary on minority status.
currentsalminority.regression <- lm(empdat$salary ~ empdat$minority)
summary(currentsalminority.regression)

 

##c. Describe the results in a paragraph.

 

##2. Current salary regression


##a. Using multiple linear regression, determine the current salary difference between
##minorities and nonminorities, controlling for the following:

salary.regression <- lm(empdat$salary ~ empdat$minority + empdat$educ + empdat$age + empdat$jobtime + empdat$age + empdat$prevexp + empdat$jobcat + empdat$Female)
summary(salary.regression)



##ii. type of job (use both dummy variables)
empdat$jobcler <- (empdat$jobcat == "Clerical")
empdat$jobcler <- (empdat$jobcat == "Custodial")

 

##iv. gender (use a female dummy variable)

empdat$genderfem <- (empdat$jobcat == "Female")





##b. Follow the R syntax using the multiple.regression function

salary.regression <- lm(empdat$salary ~ empdat$minority + empdat$educ + empdat$age + empdat$jobtime + empdat$age + empdat$prevexp + empdat$jobcat + empdat$Female)
summary(salary.regression)

 

##c. Interpreting the regression


##i. Report the F statistic, R2, P values.

##ii. Write the multiple regression equation.


##d. Interpret the model in a few paragraphs. Interpret all statistics and indicate the
##implications of the model.

 

 
