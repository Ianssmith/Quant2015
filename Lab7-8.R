Data frame for this assignment: empdat
1. Generate and interpret a simple regression model for the relationship between age and
current salary.

cor(empdat$age, empdat$salary, method="pearson", use="complete.obs")
outout:
  [1] -0.1458792

ageSalary.regression <-lm(empdat$salary~empdat$age)
summary(ageSalary.regression)
output:
  
  Call:
  lm(formula = empdat$salary ~ empdat$age)

Residuals:
  Min 1Q Median 3Q Max 
-18950 -10175 -5892 2685 103190

Coefficients:
  Estimate Std. Error t value Pr(>|t|) 
(Intercept) 41332.20 2296.37 18.0 < 2e-16 ***
  empdat$age -211.61 66.12 -3.2 0.00147 ** 
  ---
  Signif. codes: 0 ˜*** 0.001 ˜** 0.01 ˜* 0.05 ˜. 0.1 ˜  1

Residual standard error: 16930 on 471 degrees of freedom
(1 observation deleted due to missingness)
Multiple R-squared: 0.02128, Adjusted R-squared: 0.0192 
F-statistic: 10.24 on 1 and 471 DF, p-value: 0.001466


a. How much variance in salary can be explained by age?
sqrt(0.02128) =>[1] 0.1458767
about 15% can be explained by salary according to formula for explained variation

b. What is the strength of the relationship between age and salary?
The correlation is weak because the Pearsons R value is below 0.3
1.0 represents a perfect linear relationship and 0.00 represents no relationship at all. 
Since the value here is -0.145.. it is weak.

c. Is age a significant predictor of salary? How do you know?
since we are looking for a p value in the critical region below 0.05 the p-value of 0.001466 
would be significant.

d. If someoneâ€™s age increased by one year, by how much would you expect their salary
to change?
The intercept coefficient of 1,210 should be the indictor of how much salary would increased per year of age. 
e. Speculate on the nature of the relationship between age and salary in this dataset.

Since the age is a "significant" predictor of salary we can use it to make a prediction however
since the "strength" of the relationship is weak, and the significance is also influenced by other 
factors it would not be the last authority to consult when predicting any given individuals salary
there may be other variables with a stronger relationship

2. Create the appropriate dummy variable(s) for gender.
states$MIDWEST <- (states$REGION == "Midwest")
empdat$Female <- (empdat$gender == "Female")

a. Demonstrate that the variable(s) were created correctly.
summary(empdat$Female)
output A:
  Mode FALSE TRUE NA's 
logical 258 216 0

summary(empdat$gender)
output B:
Female Male 
216 258

output A == output B

3. Create the appropriate dummy variable(s) for employment category.
summary(empdat$jobcat)
empdat$Clerical <- (empdat$jobcat == "Clerical")
empdat$Manager <- (empdat$jobcat == "Manager")

a. Demonstrate that the variable(s) were created correctly.
summary(empdat$Clerical)
output:
Mode FALSE TRUE NA's 
logical 111 363 0

summary(empdat$Manager)
output:
  Mode FALSE TRUE NA's 
logical 390 84 0

summary(empdat$jobcat)
output:
Clerical Custodial Manager 
363 27 84 
390-27
=>363 == (Clerical[true])
111-27
=>84 == (Manager[true])
