



-   <a href="#question-1" id="toc-question-1">Question 1</a>
-   <a href="#answer-1" id="toc-answer-1">Answer 1</a>
-   <a href="#question-2" id="toc-question-2">Question 2</a>
-   <a href="#answer-2" id="toc-answer-2">Answer 2</a>
-   <a href="#question-3" id="toc-question-3">Question 3</a>
-   <a href="#answer-3" id="toc-answer-3">Answer 3</a>
-   <a href="#question-4" id="toc-question-4">Question 4</a>
-   <a href="#answer-4" id="toc-answer-4">Answer 4</a>
-   <a href="#question-5" id="toc-question-5">Question 5</a>
-   <a href="#answer-5" id="toc-answer-5">Answer 5</a>
-   <a href="#question-6" id="toc-question-6">Question 6</a>
-   <a href="#answer-6" id="toc-answer-6">Answer 6</a>
-   <a href="#question-7" id="toc-question-7">Question 7</a>
-   <a href="#answer-7" id="toc-answer-7">Answer 7</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Question 1

In a population of interest, a sample of 9 men yielded a sample average
brain volume of 1,100cc and a standard deviation of 30cc. What is a 95%
Student’s T confidence interval for the mean brain volume in this new
population?

## Answer 1

    n = 9
    mu = 1100
    sd = 30
    SE = sd/sqrt(n)
    mu + c(-1,1) * SE* qt(0.975,n-1)

    ## [1] 1076.94 1123.06

## Question 2

A diet pill is given to 9 subjects over six weeks. The average
difference in weight (follow up - baseline) is -2 pounds. What would the
standard deviation of the difference in weight have to be for the upper
endpoint of the 95% T confidence interval to touch 0?

## Answer 2

    n = 9
    mu_diff = -2
    SE_diff  = -mu_diff / qt(0.975,n-1)
    sd_diff = sqrt(n) * SE_diff 
    sd_diff

    ## [1] 2.601903

## Question 3

In an effort to improve running performance, 5 runners were either given
a protein supplement or placebo. Then, after a suitable washout period,
they were given the opposite treatment. Their mile times were recorded
under both the treatment and placebo, yielding 10 measurements with 2
per subject. The researchers intend to use a T test and interval to
investigate the treatment. Should they use a paired or independent group
T test and interval?

## Answer 3

A paired interval.

## Question 4

In a study of emergency room waiting times, investigators consider a new
and the standard triage systems. To test the systems, administrators
selected 20 nights and randomly assigned the new triage system to be
used on 10 nights and the standard system on the remaining 10 nights.
They calculated the nightly median waiting time (MWT) to see a
physician. The average MWT for the new system was 3 hours with a
variance of 0.60 while the average MWT for the old system was 5 hours
with a variance of 0.68. Consider the 95% confidence interval estimate
for the differences of the mean MWT associated with the new system.
Assume a constant variance. What is the interval? Subtract in this order
(New System - Old System).

## Answer 4

    mu_new = 3; var_new = 0.6; n_new = 10
    mu_old = 5; var_old = 0.68; n_old = 10

    # Since it is specified that we shall assume constant variance, we just use the pooled variance with the t distribution with df = n_new + n_old - 2. Otherwise we would have had to consider the approximation via t distribution with degrees of freedom given by another formula.

    df <- n_new + n_old - 2
    mu <- mu_new - mu_old
    sp <- sqrt(( (n_new-1) * var_new + (n_old-1) * var_old ) /df)

    CI <- mu + c(-1,1) * qt(0.975, df) * sp * sqrt(1/n_new + 1/n_old)

    CI

    ## [1] -2.751649 -1.248351

## Question 5

Suppose that you create a 95% T confidence interval. You then create a
90% interval using the same data. What can be said about the 90%
interval with respect to the 95% interval?

## Answer 5

The interval will be narrower.

## Question 6

To further test the hospital triage system, administrators selected 200
nights and randomly assigned a new triage system to be used on 100
nights and a standard system on the remaining 100 nights. They
calculated the nightly median waiting time (MWT) to see a physician. The
average MWT for the new system was 4 hours with a standard deviation of
0.5 hours while the average MWT for the old system was 6 hours with a
standard deviation of 2 hours. Consider the hypothesis of a decrease in
the mean MWT associated with the new treatment.

What does the 95% independent group confidence interval with unequal
variances suggest vis a vis this hypothesis? (Because there’s so many
observations per group, just use the Z quantile instead of the T.)

## Answer 6

    mu_new = 4; var_new = 0.5; n_new = 100
    mu_old = 6; var_old = 2; n_old = 100

    mu <- mu_old - mu_new
    var <- var_old/n_old + var_new/n_new 

    CINormal <- mu + c(-1, 1) * sqrt(var) * qnorm(0.975)
    cat(CINormal)

    ## 1.690102 2.309898

    df =  (var_new/n_new + var_old/n_old)^2 / ((var_new/n_new)^2/(n_new-1) + (var_old/n_old)^2/(n_old-1))

    CIT <- mu + c(-1, 1) * sqrt(var) * qt(0.975, df)
    cat(CIT)

    ## 1.687505 2.312495

## Question 7

Suppose that 18 obese subjects were randomized, 9 each, to a new diet
pill and a placebo. Subjects’ body mass indices (BMIs) were measured at
a baseline and again after having received the treatment or placebo for
four weeks. The average difference from follow-up to the baseline
(followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for
the placebo group. The corresponding standard deviations of the
differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the
placebo group. Does the change in BMI over the four week period appear
to differ between the treated and placebo groups? Assuming normality of
the underlying data and a common population variance, calculate the
relevant *90%* t confidence interval. Subtract in the order of
(Treated - Placebo) with the smaller (more negative) number first.

## Answer 7

    mu_t <- -3; sd_t <- 1.5; n_t <- 9
    mu_p <- 1;  sd_p <- 1.8; n_p <- 9

    mu <- mu_t - mu_p 
    df <- n_p + n_t - 2
    sp <- sqrt(((n_t-1)*sd_t**2 + (n_p-1)*sd_p**2)/(n_t + n_p - 2))

    CI <- mu + c(-1, 1) * qt(0.95, df) * sp * sqrt(1/n_t + 1/n_p)

    CI

    ## [1] -5.363579 -2.636421
