



-   <a href="#part-2-basic-inferential-data-analysis-instructions"
    id="toc-part-2-basic-inferential-data-analysis-instructions">Part 2:
    Basic Inferential Data Analysis Instructions</a>
    -   <a
        href="#load-the-toothgrowth-data-and-perform-some-basic-exploratory-data-analyses."
        id="toc-load-the-toothgrowth-data-and-perform-some-basic-exploratory-data-analyses.">1.
        Load the ToothGrowth data and perform some basic exploratory data
        analyses.</a>
    -   <a href="#provide-a-basic-summary-of-the-data."
        id="toc-provide-a-basic-summary-of-the-data.">2. Provide a basic summary
        of the data.</a>
    -   <a
        href="#use-confidence-intervals-andor-hypothesis-tests-to-compare-tooth-growth-by-supp-and-dose."
        id="toc-use-confidence-intervals-andor-hypothesis-tests-to-compare-tooth-growth-by-supp-and-dose.">3.
        Use confidence intervals and/or hypothesis tests to compare tooth growth
        by supp and dose.</a>
    -   <a
        href="#state-your-conclusions-and-the-assumptions-needed-for-your-conclusions."
        id="toc-state-your-conclusions-and-the-assumptions-needed-for-your-conclusions.">4.
        State your conclusions and the assumptions needed for your
        conclusions.</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Part 2: Basic Inferential Data Analysis Instructions

Now in the second portion of the project, we’re going to analyze the
ToothGrowth data in the `R` `datasets` package.

### 1. Load the ToothGrowth data and perform some basic exploratory data analyses.

    library(datasets)
    data("ToothGrowth")

### 2. Provide a basic summary of the data.

    summary(ToothGrowth)

    ##       len        supp         dose      
    ##  Min.   : 4.20   OJ:30   Min.   :0.500  
    ##  1st Qu.:13.07   VC:30   1st Qu.:0.500  
    ##  Median :19.25           Median :1.000  
    ##  Mean   :18.81           Mean   :1.167  
    ##  3rd Qu.:25.27           3rd Qu.:2.000  
    ##  Max.   :33.90           Max.   :2.000

### 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose.

![](Assignment2_files/figure-markdown_strict/unnamed-chunk-3-1.png)

The data is not paired, so all the tests will be performed for unpaired
data. There is no information about the variance in the two groups,
hence the variance will not be assumed equal.

#### Test over the two delivery methods (VC and OJ) irrespective of the dose

The null hypothsesis that we test for is that *there is no effect of the
delivery method on the tooth grow*,
i.e. *H*<sub>0</sub> : *μ*<sub>1</sub> − *μ*<sub>2</sub> = 0. Both
groups have 30 samples with the difference in means 3.7

The *p*-value, corresponding to the probabilty of observing such an
extreme value (3.7) under the null hypothesis assumption, i.e. under the
assumption that means of two groups are equal is 0.061.

    t <- t.test(len ~ supp, paired = FALSE, var.equal = FALSE, conf.level = 0.95, data = ToothGrowth)

    t$p.value

    ## [1] 0.06063451

However, for a 95 confidence level, the corresponding confidence
interval issued by the *t* test does contain 0.

    t$conf.int

    ## [1] -0.1710156  7.5710156
    ## attr(,"conf.level")
    ## [1] 0.95

Hence, **for a confidence level of 95% we fail to reject the null
hypothesis of no effect of the delivery method on the tooth grow**.
However, for a 90% confidence level, the corresponding confidence
interval does not contain 0 (see next cell), hence at this confidence
level the hypothesis would be rejected.

    t.test(len ~ supp, paired = FALSE, var.equal = FALSE, conf.level = 0.90, data = ToothGrowth)$conf.int

    ## [1] 0.4682687 6.9317313
    ## attr(,"conf.level")
    ## [1] 0.9

#### Test over the two delivery methods (VC and OJ) accounting for the dose

We consider the groups separated by the dose and check if there is
statistical difference in the tooth growth effect between the two
delivery methods, at equal dosages.

![](Assignment2_files/figure-markdown_strict/unnamed-chunk-8-1.png)

The t-test is performed for the two groups, corresponding to a low dose
of 0.5. In this case the 95 confidence interval does not contain zero,
hence **for a confidence level of 95% we reject the null hypothesis of
no effect of the delivery method on the tooth grow for dose equal to
0.5**.

    df<- split(ToothGrowth, ToothGrowth$dose)
    t.test(len ~ supp, paired = FALSE, var.equal = FALSE, conf.level = 0.95, data = df$`0.5`)$conf.int

    ## [1] 1.719057 8.780943
    ## attr(,"conf.level")
    ## [1] 0.95

The t-test is performed for the two groups, corresponding to a medium
dose of 1. In this case the 95 confidence interval does not contain
zero, hence **for a confidence level of 95% we reject the null
hypothesis of no effect of the delivery method on the tooth grow for
dose equal to 1**

    t.test(len ~ supp, paired = FALSE, var.equal = FALSE, conf.level = 0.95, data = df$`1`)$conf.int

    ## [1] 2.802148 9.057852
    ## attr(,"conf.level")
    ## [1] 0.95

The t-test is performed for the two groups, corresponding to a high dose
of 2. In this case the 95 confidence interval does contain zero, hence
**for a confidence level of 95% we fail to reject the null hypothesis of
no effect of the delivery method on the tooth grow for dose equal to 2**

    t.test(len ~ supp, paired = FALSE, var.equal = FALSE, conf.level = 0.95, data = df$`2`)$conf.int

    ## [1] -3.79807  3.63807
    ## attr(,"conf.level")
    ## [1] 0.95

### 4. State your conclusions and the assumptions needed for your conclusions.

Considering the full sample, i.e. not accounting for the strata induced
by the dosage, we fail to reject the null hypothesis of no effect of the
delivery method on the tooth grow. However, more granularity,
i.e. accounting for dosages can explain better the data and even in this
case, while we fail to reject the null hypothesis at a 95% confidence
level, this hypothesis would be rejected at 90% confidence level.

An effect of the delivery method can be observed for both the low and
medium doses (0.5 and 1). In those cases, the null hypothesis of no
effect of the delivery method on the tooth grow is rejected.

For high dose, we fail to reject the the null hyothesis.

This indicates that **for low levels of vitamine C, the delivery method
has effects in tooth growth**.

#### Assumptions

It was assumed that the differences between groups is not equal. It was
also assumed that the data comes from a popoulation with an underlying
bell shaped distribution (i.e. not skewed).
