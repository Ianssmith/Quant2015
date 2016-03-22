1. Conduct the appropriate hypothesis test to determine if there is a difference in depression
based on history of drug use.

a. Use variables at the appropriate level of measurement.

BECK dependant (interval-ratio)
IVHX independant (nominal)

b. Show R syntax.

summary(drugtreatment$BECK)
summary(drugtreatment$IVHX)

aggregate(BECK~IVHX, drugtreatment, mean)
anova.results <- aov(BECK~IVHX, drugtreatment)

summary(anova.results)

c. Show results tables.

summary(drugtreatment$BECK)
Min. 1st Qu. Median Mean 3rd Qu. Max. 
0.00 10.00 17.00 17.37 23.00 54.00

summary(drugtreatment$IVHX)
never previous recent 
223 109 243

IVHX BECK
1 never 15.94996
2 previous 16.64201
3 recent 18.99363

Df Sum Sq Mean Sq F value Pr(>F) 
IVHX 2 1148 574.0 6.721 0.0013 **
  Residuals 572 48850 85.4 
---
  Signif. codes: 0 ˜*** 0.001 ˜** 0.01 ˜* 0.05 ˜. 0.1 ˜  1


d. Report technical results.

The F obtained ratio value of 6.721 is significant at less than the 0.001 level so we can 
conclude that depression is significantly effected by a history of drug use.

e. In one paragraph, comment on the implications of the result of the test. Speculate.
What might be a consequence of drug use? Is this relationship cause and effect; why
or why not?

Although difficult to say with complete certainty that drug use "causes" depression 
a connection is almost certain. Given the distribution and the categories, it does 
seem that drug use could actually cause depression rather than vice versa, this is because
within the group of individuals who have a history of drug use
there is a larger difference in Beck score between those who had used recently vs those who 
had used previously, this difference may not provide an indication on it's own however
the individuals who used previously but not recently were a degree of magnitude closer to
those who had never used before. All else being equal since we have discovered
there is a significant connection this should encourage further research to be conducted into
how Beck scores are or are not effected by an interval-ratio scale of exactly
how recent the previous use of drugs was.

2. If you wanted to conduct an ANOVA hypothesis test, but both of your variables were
interval-ratio, which of the following tasks would you need to complete in order to be able to
conduct the test? Select only one answer:


b. Recode the independent variable into a nominal or ordinal variable.
