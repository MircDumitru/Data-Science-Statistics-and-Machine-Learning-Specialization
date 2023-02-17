



-   <a href="#module-8-confidence-intervals"
    id="toc-module-8-confidence-intervals">Module 8: Confidence
    Intervals</a>
    -   <a href="#the-t-distribution" id="toc-the-t-distribution">The <span
        class="math inline"><em>t</em></span>-distribution</a>
    -   <a href="#notes-about-the-t-inteval"
        id="toc-notes-about-the-t-inteval">Notes about the <span
        class="math inline"><em>t</em></span> inteval</a>
        -   <a href="#sleep-data" id="toc-sleep-data">Sleep data</a>
        -   <a href="#independent-group-t-confidence-intervals"
            id="toc-independent-group-t-confidence-intervals">Independent group
            <span class="math inline"><em>t</em></span> confidence intervals</a>
        -   <a href="#example" id="toc-example">Example</a>
        -   <a href="#example-mistakenly-treating-the-sleep-data-as-grouped"
            id="toc-example-mistakenly-treating-the-sleep-data-as-grouped">Example:
            Mistakenly treating the sleep data as grouped</a>
        -   <a href="#example-chickweight-data"
            id="toc-example-chickweight-data">Example: <code>ChickWeight</code>
            data</a>
    -   <a href="#a-note-in-unequal-variances"
        id="toc-a-note-in-unequal-variances">A note in unequal variances</a>
        -   <a href="#example-1" id="toc-example-1">Example</a>
-   <a href="#module-9-hypothesis-testing"
    id="toc-module-9-hypothesis-testing">Module 9: Hypothesis testing</a>
    -   <a href="#motivating-example" id="toc-motivating-example">Motivating
        example</a>
    -   <a href="#choosing-a-rejection-region"
        id="toc-choosing-a-rejection-region">Choosing a rejection region</a>
        -   <a href="#example-2" id="toc-example-2">Example</a>
        -   <a href="#example-reconsidered" id="toc-example-reconsidered">Example
            reconsidered</a>
    -   <a href="#t-test-in-r" id="toc-t-test-in-r">T test in R</a>
    -   <a href="#connections-with-confidence-intervals"
        id="toc-connections-with-confidence-intervals">Connections with
        confidence intervals</a>
-   <a href="#module-10-p-values" id="toc-module-10-p-values">Module 10:
    <span class="math inline"><em>p</em></span>-values</a>
    -   <a href="#what-is-a-p-value" id="toc-what-is-a-p-value">What is a <span
        class="math inline"><em>p</em></span>-value?</a>
        -   <a href="#example-3" id="toc-example-3">Example</a>
        -   <a href="#example-4" id="toc-example-4">Example</a>
        -   <a href="#poisson-example" id="toc-poisson-example">Poisson example</a>

# Module 8: Confidence Intervals

In the previous module, we discussed creating a confidence interval
using the CLT.

They took the form

$$
\text{Estimate} \pm z\_{1-\frac{\alpha}{2}} \times \text{Estimated Standard Error of the Estimate}
$$
In this module, methods for small samples are discussed, namely the
**t-distribution** and the **t confidence intervals**. These intervals
are going to be of the form:
$$
\text{Estimate} \pm t\_{1-\frac{\alpha}{2}} \times \text{Estimated Standard Error of the Estimate}
$$

The only thing that changes is the $z\_{1-\frac{\alpha}{2}}$ quantile to
a $t\_{1-\frac{\alpha}{2}}$ quantile.

Since the *t* distribution has heavier tails than the normal
distribution, the corresponding *t* confidence intervals are going to be
slightly wider.

The t intervals are one of the most handy intervals in all of
statistics, and if you ever want to rule between when to use a *t*
interval or a *z* interval for the case where both are available, simply
use the *t* interval, because as you collect more data, the *t* interval
will will be more and more like the *z* interval. This module covers the
single and two group version of the *t* interval.

## The *t*-distribution

The *t* distribution density is always centered around zero and is
defined via only one paramter, the **degrees of freedom** parameter
*ν* &gt; 0 (associated with the scale of the distribution) and via the
*Gamma function* *Γ*(⋅):
$$
t\left(x \mid \nu \right)
=
\frac
{\Gamma\left(\frac{\nu + 1}{2}\right)}
{\sqrt{\nu \pi}\\;\Gamma\left(\frac{\nu}{2}\right)}
\left( 1 + \frac{x^2}{\nu} \right)^{-\frac{\nu +1}{2}}
$$

It has heavier (thicker) tails than the normal distribution, and as the
number of degrees of freedom increase its density looks more and more
like a normal distribution:

    x <- seq(-4, 4, by = 0.01)
    par(bty="l")
    plot(x, dnorm(x), 
         type = 'l',  lwd = 3,  
         xlab = 'x', ylab = 'density', 
         col = yarrr::transparent('maroon2', .6))
    lines(x, dt(x, df = 1), 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('cyan2', .6))
    lines(x, dt(x, df = 2), 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('olivedrab4', .6))
    lines(x, dt(x, df = 5), 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('magenta4', .6))

    legend('topright', 
           legend = c('N(x | 0, 1)', 't(x | 1)', 't(x | 2)', 't(x | 5)'),
           col = c(yarrr::transparent('maroon2', .6),
                   yarrr::transparent('cyan3', .6),
                   yarrr::transparent('olivedrab4', .6),
                   yarrr::transparent('magenta4', .6)),
           bty = "n", lty = 1, lwd = '3')

![](Notes3_files/figure-markdown_strict/unnamed-chunk-1-1.png)

The *t* distribution appears naturally by considering Gaussian *i.i.d*
r.v. In this setting, by subtracting the population mean *μ* from the
sample mean *X̄* and dividing by $\sigma/\sqrt{n}$, we would obtained
precisely the standard normal distribution. However, if the population
standard deviation *σ* is plugged in, the resulting distribution is a
*t* distribution with *ν* = *n* − 1 degrees of freedom.
$$
\begin{cases}
X\_1, \ldots, X\_n, \\; \text{i.i.d},
\\\\
X\_1 \sim \text{Normal}
\left( x \mid \mu, \sigma^2 \right)
\end{cases}
\Rightarrow
\begin{cases}
\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}
\sim 
\text{Normal}\left(x \mid 0, 1\right)
\\\\
\frac{\bar{X}-\mu}{S/\sqrt{n}}
\sim 
t(x \mid n-1)
\end{cases}
$$

As the number of degrees increase, i.e. as we collect more data in the
sample, the distinction between the Normal and t distribution becomes
irrelevant. For small samples, the difference can be quite large. Using
the standard normal distribution for small sample sizes leads to
confidence intervals that are too narrow.

The t confidence interval is

$$
\bar{X} \pm t\_{n-1} \frac{S}{\sqrt{n}}
$$

with *t*<sub>*n* − 1</sub> denoting the relevant quantile
(e.g. 95%,90%,…) corresponding to the t distribution with *n* − 1
degrees of freedom.

## Notes about the *t* inteval

-   The *t* interval technically assumes that the data are normal,
    though it is robust to this assumption.
-   It works well whenever the distribution of the data is roughly
    symmetric and mound shaped.
-   Paired observations are often analyzed using the *t* interval by
    taking differences or log-differences.
-   For large degrees of freedom, *t* quantiles become the same as
    standard normal quantiles, therefore this interval converges to the
    same interval as the CLT yielded.
-   For skewed distributions the spirit of the *t* interval assumptions
    are violated; one way to still use the t confidence intervals for
    such data is to work on the log scale, since logging often take care
    of the skewness of the data; if it is not the case, other procedures
    should be used, like bootstrap confidence intervals.
    -   For skewed distributions, it doesn’t make sense to center the
        interval at the mean.
-   For highly discrete data, like binary, other intervals are available
    and should be used instead of the *t* confidence intervals.

### Sleep data

The data originally analyzed in Gosset’s Biometrika paper is considered.
The data shows the increase in hours for 10 patients on two drugs.

    data(sleep)
    head(sleep)

    ##   extra group ID
    ## 1   0.7     1  1
    ## 2  -1.6     1  2
    ## 3  -0.2     1  3
    ## 4  -1.2     1  4
    ## 5  -0.1     1  5
    ## 6   3.4     1  6

    str(sleep)

    ## 'data.frame':    20 obs. of  3 variables:
    ##  $ extra: num  0.7 -1.6 -0.2 -1.2 -0.1 3.4 3.7 0.8 0 2 ...
    ##  $ group: Factor w/ 2 levels "1","2": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ ID   : Factor w/ 10 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...

    par(bty = 'l')
    plot(as.integer(sleep$group), sleep$extra,
          xlim  = c(0.5,2.5), cex = 2, pch = 19,
          xlab = 'group', ylab = 'extra',
          col = yarrr::transparent('maroon2', .6))
    for(df in split(sleep, sleep$ID)){
          lines(df$group, df$extra, col=df$ID[1], 
                lwd = 3)
    }
    legend('topright', 
           legend = as.character(1:10),
           col = sleep$ID, 
           bty = "n", lty = 1, lwd = '3')

![](Notes3_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    g1 <- sleep$extra[1:10]
    g2 <- sleep$extra[11:20]
    difference <- g2 - g1
    mu <- mean(difference)
    S <- sd(difference)
    n <- 10

    mu + c(-1, 1)* qt(.975, n-1) * S / sqrt(n)

    ## [1] 0.7001142 2.4598858

    t.test(difference)

    ## 
    ##  One Sample t-test
    ## 
    ## data:  difference
    ## t = 4.0621, df = 9, p-value = 0.002833
    ## alternative hypothesis: true mean is not equal to 0
    ## 95 percent confidence interval:
    ##  0.7001142 2.4598858
    ## sample estimates:
    ## mean of x 
    ##      1.58

    t.test(g2, g1, paired = TRUE)

    ## 
    ##  Paired t-test
    ## 
    ## data:  g2 and g1
    ## t = 4.0621, df = 9, p-value = 0.002833
    ## alternative hypothesis: true mean difference is not equal to 0
    ## 95 percent confidence interval:
    ##  0.7001142 2.4598858
    ## sample estimates:
    ## mean difference 
    ##            1.58

    t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)

    ## 
    ##  Paired t-test
    ## 
    ## data:  extra by I(relevel(group, 2))
    ## t = 4.0621, df = 9, p-value = 0.002833
    ## alternative hypothesis: true mean difference is not equal to 0
    ## 95 percent confidence interval:
    ##  0.7001142 2.4598858
    ## sample estimates:
    ## mean difference 
    ##            1.58

### Independent group *t* confidence intervals

Suppose that we want to compare the mean blood pressure between two
groups in a randomzied trial: those who received the treatment and those
who received the placebo. (This is like the A/B testing.)

In a randomized trial (or in A/B testing) randomization is performed in
order to balance unobserved covariats that may contaminate the results.
The randomization allows to compare the two groups with a *t* confidence
interval or a *t* test, which will be covered later.

A paired *t* test can’t be used because there is no matching of the
subjects between the two groups.

Here are introduced methods from comparing across independent groups.

A (1−*α*) × 100% confidence interval for
*μ*<sub>*y*</sub> − *μ*<sub>*x*</sub> is

$$
\bar{Y} - \bar{X}
\pm
t\_{n\_x + n\_y - 2,\\; 1 - \alpha/2}
\\;
S\_{p}
\left(
\frac{1}{n\_x}
+
\frac{1}{n\_y}
\right)^{1/2}
$$
where

-   *Ȳ* − *X̄* is the difference between the average in one group and the
    average in the other group.
-   $t\_{n\_x + n\_y - 2, 1 - \frac{\alpha}{2}}$ is the relevanat
    quantalile corresponding to the *t* distribution with the number of
    degrees of freedom corresopnding to the sum of two group samples
    minus two.
-   *S*<sub>*p*</sub>(1/*n*<sub>*x*</sub>+1/*n*<sub>*y*</sub>)<sup>1/2</sup>
    is the standard error of the difference
-   *S*<sub>*p*</sub><sup>2</sup> is the **pooled variance**, defined as

$$
S^2\_{p}
=
\frac{
(n\_x - 1)S\_{x}^{2}
+
(n\_y - 1)S\_{y}^{2}
}
{n\_x + n\_y -2}
$$
\* If the number of observations in each group is the same,
*n*<sub>*x*</sub> = *n*<sub>*y*</sub> then the pooled variance is
*S*<sub>*p*</sub><sup>2</sup> = (*S*<sub>*x*</sub><sup>2</sup>+*S*<sub>*y*</sub><sup>2</sup>)/2
i.e. the simple average of the variance from *x* group and the variance
from *y* group. \* If the number of observations in each group differs,
the pooled variance is weighting the two variances proportional to their
sample size.

-   The confidence interval for *μ*<sub>*y*</sub> − *m**u*<sub>*x*</sub>
    is *assuming* a constant variance across the two groups (this
    assumption is reasonable because of randomization)

-   If there is some doubt, assume a different variance per group.

### Example

-   Comparing SBP for 8 oral contraceptive users versus 21 controls
-   *X̄*<sub>*O**C*</sub> = 132.86 mmHg with *s*<sub>*O**C*</sub> = 15.34
-   *X̄*<sub>*C*</sub> = 127.44 mmHg with *s*<sub>*C*</sub> = 18.23
-   Pooled variance estimate

<!-- -->

    sp <- sqrt(((8-1)*15.34**2 + (21-1)*18.23**2)/(8 + 21 - 2))

    132.86 - 127.44 + c(-1, 1)*qt(0.975, 8 + 21 - 2)*sp*sqrt((1/8 + 1/21))

    ## [1] -9.521097 20.361097

### Example: Mistakenly treating the sleep data as grouped

The sleep drugs data is considered in this example, but pretending the
subjects were not matched, i.e. we are going to assume the data
represents two groups.

1.  The confidence interval using the *t* distribution can be computed
    straightforward:

-   compute the difference between the sample mean of the two groups:
    $\mu = \bar{X\_1} - \bar{X\_2}$.

-   compute the pooled standard deviation:
    $S\_p = \sqrt{\left\[ (n\_{x\_1} - 1)S\_{x\_1}^{2} + (n\_{x\_2} - 1)S\_{x\_2}^{2} \right\] / \left(n\_{x\_1} + n\_{x\_2} -2\right)}$.

-   compute the confidence interval:
    $\mu + t\_{n\_x + n\_y - 2, \\; 1 - \alpha/2} S\_p \sqrt{1/n\_x + 1/n\_y}$

1.  The confidence interval can be obtained using the *t* test (i.e
    `t.test()`) specifying that the groups are **not** paird
    (i.e. `paired = TRUE`) and equal variances
    (i.e. `var.equal = TRUE`).

2.  If the test is runed with paired groups, the result is wrong.

<!-- -->

    x1 <- sleep$extra[1:10]; 
    x2 <- sleep$extra[11:20]
    n1 <- length(g1); 
    n2 <- length(g2)
    sp <- sqrt(((n1-1)*sd(x1)**2 + (n2-1)*sd(x2)**2)/(n1 + n2 - 2))
    md <- mean(g2) - mean(g1)
    semd <- sp * sqrt(1/n1 + 1/n2)

    md + c(-1, 1)* qt(.975, n1 + n2 -2) * semd

    ## [1] -0.203874  3.363874

    t.test(g2, g1, paired = FALSE, var.equal = TRUE)$conf

    ## [1] -0.203874  3.363874
    ## attr(,"conf.level")
    ## [1] 0.95

    t.test(g2, g1, paired = TRUE)$conf

    ## [1] 0.7001142 2.4598858
    ## attr(,"conf.level")
    ## [1] 0.95

### Example: `ChickWeight` data

    library(dataset)

    ## 
    ## Attaching package: 'dataset'

    ## The following object is masked from 'package:base':
    ## 
    ##     as.data.frame

    data("ChickWeight")
    head(ChickWeight)

    ##   weight Time Chick Diet
    ## 1     42    0     1    1
    ## 2     51    2     1    1
    ## 3     59    4     1    1
    ## 4     64    6     1    1
    ## 5     76    8     1    1
    ## 6     93   10     1    1

    library(reshape2)
    wideCW <- dcast(ChickWeight, 
                    Diet + Chick ~ Time,
                    value.var = 'weight'
                    )
    head(wideCW)

    ##   Diet Chick  0  2  4  6  8 10 12 14 16  18  20  21
    ## 1    1    18 39 35 NA NA NA NA NA NA NA  NA  NA  NA
    ## 2    1    16 41 45 49 51 57 51 54 NA NA  NA  NA  NA
    ## 3    1    15 41 49 56 64 68 68 67 68 NA  NA  NA  NA
    ## 4    1    13 41 48 53 60 65 67 71 70 71  81  91  96
    ## 5    1     9 42 51 59 68 85 96 90 92 93 100 100  98
    ## 6    1    20 41 47 54 58 65 73 77 89 98 107 115 117

    names(wideCW)[-(1 : 2)] <- paste('time', names(wideCW)[-(1 : 2)], 
                                     sep = '')
    head(wideCW)

    ##   Diet Chick time0 time2 time4 time6 time8 time10 time12 time14 time16 time18
    ## 1    1    18    39    35    NA    NA    NA     NA     NA     NA     NA     NA
    ## 2    1    16    41    45    49    51    57     51     54     NA     NA     NA
    ## 3    1    15    41    49    56    64    68     68     67     68     NA     NA
    ## 4    1    13    41    48    53    60    65     67     71     70     71     81
    ## 5    1     9    42    51    59    68    85     96     90     92     93    100
    ## 6    1    20    41    47    54    58    65     73     77     89     98    107
    ##   time20 time21
    ## 1     NA     NA
    ## 2     NA     NA
    ## 3     NA     NA
    ## 4     91     96
    ## 5    100     98
    ## 6    115    117

    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    wideCW <- mutate(wideCW, gain = time21 - time0)
    head(wideCW)

    ##   Diet Chick time0 time2 time4 time6 time8 time10 time12 time14 time16 time18
    ## 1    1    18    39    35    NA    NA    NA     NA     NA     NA     NA     NA
    ## 2    1    16    41    45    49    51    57     51     54     NA     NA     NA
    ## 3    1    15    41    49    56    64    68     68     67     68     NA     NA
    ## 4    1    13    41    48    53    60    65     67     71     70     71     81
    ## 5    1     9    42    51    59    68    85     96     90     92     93    100
    ## 6    1    20    41    47    54    58    65     73     77     89     98    107
    ##   time20 time21 gain
    ## 1     NA     NA   NA
    ## 2     NA     NA   NA
    ## 3     NA     NA   NA
    ## 4     91     96   55
    ## 5    100     98   56
    ## 6    115    117   76

    library(ggplot2)
    p <- ggplot(data = ChickWeight, aes(x = Time, y = weight, group = Chick))
    p + geom_line(aes(col = Diet)) + facet_wrap(. ~ Diet) 

![](Notes3_files/figure-markdown_strict/unnamed-chunk-7-1.png)

    p <- ggplot(data = wideCW, aes(x = Diet, y = gain))
    p + geom_violin(aes(fill = Diet))

    ## Warning: Removed 5 rows containing non-finite values (`stat_ydensity()`).

![](Notes3_files/figure-markdown_strict/unnamed-chunk-8-1.png)

The *t* test comparing the diets 1 and 4:

    wideCW14 <- subset(wideCW, Diet %in% c(1,4))
    head(wideCW14)

    ##   Diet Chick time0 time2 time4 time6 time8 time10 time12 time14 time16 time18
    ## 1    1    18    39    35    NA    NA    NA     NA     NA     NA     NA     NA
    ## 2    1    16    41    45    49    51    57     51     54     NA     NA     NA
    ## 3    1    15    41    49    56    64    68     68     67     68     NA     NA
    ## 4    1    13    41    48    53    60    65     67     71     70     71     81
    ## 5    1     9    42    51    59    68    85     96     90     92     93    100
    ## 6    1    20    41    47    54    58    65     73     77     89     98    107
    ##   time20 time21 gain
    ## 1     NA     NA   NA
    ## 2     NA     NA   NA
    ## 3     NA     NA   NA
    ## 4     91     96   55
    ## 5    100     98   56
    ## 6    115    117   76

    rbind(
    t.test(gain~Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)$conf,
    t.test(gain~Diet, paired = FALSE, var.equal = FALSE, data = wideCW14)$conf
    )

    ##           [,1]      [,2]
    ## [1,] -108.1468 -14.81154
    ## [2,] -104.6590 -18.29932

## A note in unequal variances

For *n*<sub>1</sub> normal random variables
*X*<sub>11</sub>, …, *X*<sub>1*n*<sub>1</sub></sub> in group 1, with
𝔼\[*X*<sub>11</sub>\] = *μ*<sub>1</sub> and
𝕍𝕒𝕣\[*X*<sub>11</sub>\] = *σ*<sub>1</sub><sup>2</sup> and
*n*<sub>2</sub> normal random variables
*X*<sub>21</sub>, …, *X*<sub>2*n*<sub>2</sub></sub> in group 2, with
𝔼\[*X*<sub>21</sub>\] = *μ*<sub>2</sub> and
𝕍𝕒𝕣\[*X*<sub>21</sub>\] = *σ*<sub>2</sub><sup>2</sup> the difference
between the average random variables $\bar{X\_1}$ and $\bar{X\_2}$ have
the expected mean and variance, respectively:

-   $\mathbb{E} \left\[ \bar{X\_2} - \bar{X\_1} \right\] = \mathbb{E} \left\[ \bar{X\_2}\right\] - \mathbb{E} \left\[ \bar{X\_1} \right\] = \mu\_{2} - \mu\_{1}.$

-   $\mathbb{V} \left\[ \bar{X\_2} - \bar{X\_1} \right\] = \mathbb{V} \left\[ \bar{X\_2}\right\] + \mathbb{V} \left\[ \bar{X\_1} \right\] = \frac{\sigma\_{2}^2}{n\_2} + \frac{\sigma\_{2}^2}{n\_1}.$

For both $\bar{X\_1}$ and $\bar{X\_2}$, using the corresponding
population standard deviations *σ*<sub>1</sub> and *σ*<sub>2</sub>:

-   $\bar{X\_1} \sim \mu\_1 + \sqrt{\frac{\sigma\_{1}^{2}}{n\_1}} \text{Normal} \left( x \mid 0, 1 \right)$
-   $\bar{X\_2} \sim \mu\_2 + \sqrt{\frac{\sigma\_{2}^{2}}{n\_2}} \text{Normal} \left( x \mid 0, 1 \right)$

For both $\bar{X\_1}$ and $\bar{X\_2}$, using the corresponding sample
standard deviations *S*<sub>1</sub> and *S*<sub>2</sub>:

-   $\bar{X\_1} \sim \mu\_1 + \sqrt{\frac{S\_{1}^{2}}{n\_1}} t \left( x \mid n\_1 - 1 \right)$
-   $\bar{X\_2} \sim \mu\_2 + \sqrt{\frac{S\_{2}^{2}}{n\_2}} t \left( x \mid n\_2 - 1 \right)$

The random variable corresponding to the group averages difference
$\bar{X\_1} - \bar{X\_2}$ does **not** follow a *t* distribution.
Instead it can be approximated by a *t* distribution

-   $\bar{X\_1} - \bar{X\_2} \sim \mu\_1 - \mu\_2 + \sqrt{\frac{\sigma\_{2}^2}{n\_2} + \frac{\sigma\_{2}^2}{n\_1}} \text{t}\left(x\mid \text{df} \right)$

with a rather elaborate formula for the corresponding degrees of
freedom, involving not only the sample sizes but the estimated standard
deviations from the two groups:

-   $\text{df} = \frac{ \left( S\_{1}^{2}/n\_1 + S\_{1}^{2}/n\_1\right)^2}{\left( S\_{1}^{2}/n\_1 \right)^2/(n\_1-1) + \left( S\_{2}^{2}/n\_2 \right)^2/(n\_2-1)}$

This approximation can be used in order to use the *t* distribution for
building confidence intervals for the case where the groups have
different variances.

### Example

-   Comparing SBP for 8 oral contraceptive users versus 21 controls
-   *X̄*<sub>*O**C*</sub> = 132.86 mmHg with *s*<sub>*O**C*</sub> = 15.34
-   *X̄*<sub>*C*</sub> = 127.44 mmHg with *s*<sub>*C*</sub> = 18.23

The corresponding degrees of freedom when using the *t* distribution for
different group variances according to the formula and the t quantile
for 95 confidence interval for the corresponding degrees of freedom are

    nOC = 8; muOC = 132.86; sOC = 15.34
    nC = 21; muC = 127.44; sC = 18.23

    df =  (sOC^2/nOC + sC^2/nC)^2 / ((sOC^2/nOC)^2/(nOC-1) + (sC^2/nC)^2/(nC-1))
    cat(c(df, qt(0.975, df)))

    ## 15.03518 2.131015

-   df = 15.04, *t*<sub>df, 0.975</sub> = 2.13

<!-- -->

    muOC - muC + c(-1, 1) * sqrt(sOC^2/nOC + sC^2/nC) * qt(0.975, df)

    ## [1] -8.913327 19.753327

-   Confidence interval estimate: \[−8.91,19.75\]

-   In `R`, `t.test(..., var.equal = FALSE)$conf`

# Module 9: Hypothesis testing

Hypothesis testing is concerned with making decisions using data.

Typically, hypothesis testing involves a **null hypothesis** ,
representing the *status quo*, usually labeled *H*<sub>0</sub>.

The null hypothesis is *assumed* to be true and statistical evidence is
required to reject it in favor of a research or **alternative
hypothesis**, usually labeled *H*<sub>*a*</sub>

### Motivating example

-   A respiratory disturbance index (RDI) of more than 30 events / hour,
    say, is considered evidence of severe sleep disorderd breathing
    (SDB)

-   Suppose that in a sample of 100 overweight subjects with other risk
    factors for SDB at a sleep clinic, the (sample) mean RDI was 32
    events / hour with a standard deviation of 10 events / hour.

-   We might want to test the hypothesis that:

    -   *H*<sub>0</sub> : *μ* = 30
    -   *H*<sub>0</sub> : *μ* &gt; 30 where *μ* represents the
        population mean RDI.

-   The alternative hypothesis are typically of the form &lt;, &lt; or
    ≠.

-   There are four possible outcomes of the statistical decision
    process:

<table>
<thead>
<tr class="header">
<th style="text-align: center;">TRUTH</th>
<th style="text-align: center;">DECIDE</th>
<th style="text-align: center;">RESULT</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub>0</sub></span></td>
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub>0</sub></span></td>
<td style="text-align: center;">Correctly accept null</td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub>0</sub></span></td>
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub><em>a</em></sub></span></td>
<td style="text-align: center;">Type I error</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub><em>a</em></sub></span></td>
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub><em>a</em></sub></span></td>
<td style="text-align: center;">Correctly reject null</td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub><em>a</em></sub></span></td>
<td style="text-align: center;"><span
class="math inline"><em>H</em><sub>0</sub></span></td>
<td style="text-align: center;">Type II error</td>
</tr>
</tbody>
</table>

-   The **Type I error rate** and the **Type II error rate** are related
    in the sense that:

    -   as the Type I error rate increases, the Type II error rate
        decreases;
    -   as the Type I error rate decreases, the Type II error rate
        increases;

-   This can be illustrated by considering a court of law. In most
    courts, the null hypothesis is “*H*<sub>0</sub>: the defendant is
    innocent until proven guilty”. Rejecting the null hypothesis means
    convicting the defendant. Evidence and a standard on that evidence
    is required to reject the null hypothesis.

    -   Setting a very low standard, i.e., not requiring much evidence
        to convict people, leads to increased percentage of innocent
        people convicted, (increased Type I errors rates) and increased
        the percentage of guilty people convicted (decreased Type II
        errors rates).

    -   Setting a very high standard would increase the percentage of
        innocent people let free (decreased Type I errors rates) but
        also increased percentage of guilty people let free (decreased
        Type II errors rates).

## Choosing a rejection region

One strategy for rejecting the null hypothesis is if if the probability
of Type I error, denoted *a**l**p**h**a* and known as the **significance
level** is smaller or equal than some constant *C*.

$$
\begin{align}
\text{Significance level} 
&
= 
\alpha 
\\\\&
=
\text{probability we incorrectly reject } H\_0
\\\\&
=
P\left( \text{reject } H\_0 \mid H\_0 \right)
\\\\&
=
P\left( \text{Type I error} \right)
\\\\&
\end{align}
$$

*C* = 0.05 has emerged as sort of a benchmark in hypothesis testing.

### Example

For the respiratory disturbance example,

-   the sample size is *n* = 100.
-   the standard deviation is *σ* = 10.
-   the standard error of the mean is SEM = 1.

The null hypothesis is that average mean *X̄* follows a normal
distribution with mean 30 and variance 1.

-   *H*<sub>0</sub> : *X* ∼ Normal(*x*∣30,1)

The 95th percentile of a normal distribution is 1.645 standard
deviations from the mean. Setting

-   *C* = 30 + 1 × 1.645 = 31.645

    -   means that the probability that a sample from Normal(*x*∣30,1)
        is larger than *C* is 5%.
    -   the rule “reject *H*<sub>0</sub>” when *X̄* ≥ 31.645 has the
        property that is 5% when *H*<sub>0</sub> is true (for the given
        *μ*, *σ* and *n*).

### Example reconsidered

Consider the respiratory disturbance example again and suppose *n* = 16
(rather than 100)

The statsitic:
$$
\frac{\bar{X} - 30}{s/\sqrt{16}}
$$
follows a *t* distribution with 15 df under *H*<sub>0</sub>

Under the *H*<sub>0</sub> hypothesis, the probability that it is larger
than the 95 percentile of the *t* distribution is 5%

The 95 percentile of the *t* distribution with 15 df is 1.75305.

    qt(0.95, 15)

    ## [1] 1.75305

The test statistic is $\sqrt{16} \left( 32 - 30 \right)/10 = 0.8$. Since
0.8 &lt; 1.75305, for the significance level *α* = 0.05, the null
hypothesis is not rejected.

## T test in R

    library(UsingR)

    ## Loading required package: MASS

    ## 
    ## Attaching package: 'MASS'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

    ## Loading required package: HistData

    ## Loading required package: Hmisc

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## 
    ## Attaching package: 'Hmisc'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     src, summarize

    ## The following objects are masked from 'package:base':
    ## 
    ##     format.pval, units

    ## 
    ## Attaching package: 'UsingR'

    ## The following object is masked from 'package:survival':
    ## 
    ##     cancer

    data(father.son)
    head(father.son)

    ##    fheight  sheight
    ## 1 65.04851 59.77827
    ## 2 63.25094 63.21404
    ## 3 64.95532 63.34242
    ## 4 65.75250 62.79238
    ## 5 61.13723 64.28113
    ## 6 63.02254 64.24221

    t.test(father.son$sheight-father.son$fheight)

    ## 
    ##  One Sample t-test
    ## 
    ## data:  father.son$sheight - father.son$fheight
    ## t = 11.789, df = 1077, p-value < 2.2e-16
    ## alternative hypothesis: true mean is not equal to 0
    ## 95 percent confidence interval:
    ##  0.8310296 1.1629160
    ## sample estimates:
    ## mean of x 
    ## 0.9969728

    t.test(father.son$sheight, father.son$fheight, paired = TRUE)

    ## 
    ##  Paired t-test
    ## 
    ## data:  father.son$sheight and father.son$fheight
    ## t = 11.789, df = 1077, p-value < 2.2e-16
    ## alternative hypothesis: true mean difference is not equal to 0
    ## 95 percent confidence interval:
    ##  0.8310296 1.1629160
    ## sample estimates:
    ## mean difference 
    ##       0.9969728

## Connections with confidence intervals

-   Consider testing *H*<sub>0</sub> : *μ* = *μ*<sub>0</sub>, versus
    *H*<sub>*a*</sub> : *μ* ≠ *μ*<sub>0</sub>.

-   Take the set of all possible valies for which you fail to reject
    *H*<sub>0</sub>, this set is a (1−*α*)100% confidence interval for
    *μ*.

-   The same works in reverse: if a (1−*α*)100% confidence interval
    *μ*<sub>0</sub>, then we fail to reject *H*<sub>0</sub>.

<!-- -->

    library(dataset)
    data("ChickWeight")


    library(reshape2)
    wideCW <- dcast(ChickWeight, 
                    Diet + Chick ~ Time,
                    value.var = 'weight'
                    )

    names(wideCW)[-(1 : 2)] <- paste('time', names(wideCW)[-(1 : 2)], 
                                     sep = '')
    library(dplyr)
    wideCW <- mutate(wideCW, gain = time21 - time0)
    head(wideCW)

    ##   Diet Chick time0 time2 time4 time6 time8 time10 time12 time14 time16 time18
    ## 1    1    18    39    35    NA    NA    NA     NA     NA     NA     NA     NA
    ## 2    1    16    41    45    49    51    57     51     54     NA     NA     NA
    ## 3    1    15    41    49    56    64    68     68     67     68     NA     NA
    ## 4    1    13    41    48    53    60    65     67     71     70     71     81
    ## 5    1     9    42    51    59    68    85     96     90     92     93    100
    ## 6    1    20    41    47    54    58    65     73     77     89     98    107
    ##   time20 time21 gain
    ## 1     NA     NA   NA
    ## 2     NA     NA   NA
    ## 3     NA     NA   NA
    ## 4     91     96   55
    ## 5    100     98   56
    ## 6    115    117   76

    wideCW14 <- subset(wideCW, Diet %in% c(1,4))

    t.test(gain~Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  gain by Diet
    ## t = -2.7252, df = 23, p-value = 0.01207
    ## alternative hypothesis: true difference in means between group 1 and group 4 is not equal to 0
    ## 95 percent confidence interval:
    ##  -108.14679  -14.81154
    ## sample estimates:
    ## mean in group 1 mean in group 4 
    ##        136.1875        197.6667

# Module 10: *p*-values

-   The *p*-values are a convenient way to communicate the results of a
    hypothesis test.

-   When communicating a *p*-value, the reader can perform the test at
    whatever Type I error rate *α* that they would like, compare the
    *p*-value to the desired Type I error rate and if the *p*-value is
    smaller, reject the null hypothesis.

-   The *p*-value is **the probability of getting data as or more
    extreme than the observed data** in favor of the alternative.

-   The probability calculation is done assuming that the null
    hypothesis is true.

-   For example, for a very large *t* statistic, the *p*-value answers
    the question “How likely would it be to get a statistic this large
    or larger if the null was actually true?”. If the answer to that
    question is “very unlikely”, in other words the *p*-value is very
    small, then it sheds doubt on the null being true, since you
    actually observed a statistic that extreme.

## What is a *p*-value?

-   The *p*-values are the most common measure of statistical
    significance.

-   Their ubiquity, along with the concern over their interpretation and
    use makes them controversial among statisticians.

    -   *Statistical Evidence: A Likelihood Paradigm* by *Richard
        Royall*
    -   *Toward evidence-based medical statistics. 1: The P value
        fallacy* by *Steve N. Goodman*
    -   *The Earth is Round (p&lt;0.05)* by *J. Cohen*
    -   <https://errorstatistics.com>
    -   <https://normaldeviate.wordpress.com>

-   **Idea**: Suppose nothing is going on - how unusual is to see the
    estimate we got?

-   **Approach**:

    1.  Define the hypothetical distribution of a data summary
        (statistic) when “nothing is going on” (*null hypothesis*)
    2.  Calculate the summary/statstic with the data we have (*test
        statistic*)
    3.  Compare what we calculated to our hypothetical distribution and
        see if the value is “extreme” (*p-value*)

The *p*-value is the probability under the null hypothesis of obtaining
evidence (as a test statistic) as extreme or more extrme than that
obtained.

If the *p*-value is small, then \* either *H*<sub>0</sub> is true and we
have observed a rare event \* either *H*<sub>0</sub> is false

### Example

Suppose you get a *t* statsistic of 2.5 for 15 df, testing
*H*<sub>0</sub> : *μ* = *μ*<sub>0</sub> versus
*H*<sub>*a*</sub> : *μ* &gt; *μ*<sub>0</sub>.

What is the probability of getting a *t* statistic as large as 2.5?

    pt(2.5, 15, lower.tail = FALSE)

    ## [1] 0.0122529

### Example

Suppose a friend has 8 children, 7 of which are girls and none are
twins.

If each gender has an independent 50% probability for each birth, what’s
the probability of getting 7 or more girls out of 8 birth?

*H*<sub>0</sub> : *p* = 0.5 versus *H*<sub>*a*</sub> : *p* &gt; 0.5

    pbinom(6,8,1/2, lower.tail = FALSE)

    ## [1] 0.03515625

We would reject at a *α* = 0.05 significance level, we would still
reject at a *α* = 0.04 significance level but we would not reject at a
*α* = 0.03 significance level.

### Poisson example

Suppose that a hospital has an infection rate of 10 infections per 100
person/days at risk (rate of 0.1) during the last monitoring period.

Assume that an infection rate of 0.05 is an important benchmark.

Assume that the count, the number of infection is Poisson

Given the model, could the observed rate being larger than 0.05 be
attributed to chance?

The null hypothesis *H*<sub>0</sub> : *λ* = 0.05, so that *λ* × 100 = 5

The alternative hypothesis *H*<sub>*a*</sub> : *λ* &gt; 0.05

    ppois(9, 5, lower.tail = FALSE)

    ## [1] 0.03182806
