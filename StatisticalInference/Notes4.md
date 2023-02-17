



-   <a href="#module-11-power" id="toc-module-11-power">Module 11: Power</a>
    -   <a href="#calculating-power-for-gaussian-data"
        id="toc-calculating-power-for-gaussian-data">Calculating power for
        Gaussian data</a>
    -   <a href="#t-test-power" id="toc-t-test-power"><span
        class="math inline"><em>t</em></span>-test power</a>
        -   <a href="#examples" id="toc-examples">Examples</a>
-   <a href="#module-12-multiple-comparisons"
    id="toc-module-12-multiple-comparisons">Module 12: Multiple
    Comparisons</a>
    -   <a href="#the-three-eras-of-statistics-efron"
        id="toc-the-three-eras-of-statistics-efron">The three eras of statistics
        (Efron)</a>
    -   <a href="#types-of-errors" id="toc-types-of-errors">Types of errors</a>
    -   <a href="#error-rates" id="toc-error-rates">Error rates</a>
        -   <a href="#controling-the-false-positive-rate"
            id="toc-controling-the-false-positive-rate">Controling the false
            positive rate</a>
        -   <a href="#controling-family-wise-error-rate-fwer"
            id="toc-controling-family-wise-error-rate-fwer">Controling family-wise
            error rate (FWER)</a>
        -   <a href="#controling-false-discover-rate-fdr"
            id="toc-controling-false-discover-rate-fdr">Controling false discover
            rate (FDR)</a>
        -   <a href="#adjusted-p-values" id="toc-adjusted-p-values">Adjusted <span
            class="math inline"><em>p</em></span>-values</a>
-   <a href="#module-13-resampling" id="toc-module-13-resampling">Module 13:
    Resampling</a>
    -   <a href="#the-bootstrap" id="toc-the-bootstrap">The Bootstrap</a>
        -   <a href="#example" id="toc-example">Example</a>
    -   <a href="#the-bootstrap-principle" id="toc-the-bootstrap-principle">The
        Bootstrap principle</a>
    -   <a href="#nonparameteric-bootstrap-algorithm-example"
        id="toc-nonparameteric-bootstrap-algorithm-example">Nonparameteric
        bootstrap algorithm example</a>
        -   <a href="#example-code" id="toc-example-code">Example code</a>
        -   <a href="#notes-on-the-bootstrap" id="toc-notes-on-the-bootstrap">Notes
            on the bootstrap</a>
    -   <a href="#permutation-tests" id="toc-permutation-tests">Permutation
        tests</a>
        -   <a href="#group-comparisons-example"
            id="toc-group-comparisons-example">Group comparisons example</a>
        -   <a href="#variations-on-perumation-testing"
            id="toc-variations-on-perumation-testing">Variations on perumation
            testing</a>
        -   <a href="#permutation-test-b-vs.-c"
            id="toc-permutation-test-b-vs.-c">Permutation test B vs. C</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Module 11: Power

In the last module, the Type I error rate *α* was discussed, i.e. the
probability of rejecting the null hypothesis when it’s true. The
hypothesis test was structured so that the probability of Type I error
is small.

The other possible error is to fail to reject when the alternative is
true, i.e. the Type II error. The **power** is defined as *the
probability of correctly rejecting *H*<sub>0</sub>*, i.e. as one minus
the probability of Type II error. Ideally, a hypothesis test should have
a large power (near 1).
$$
\begin{align}
\text{Power} 
&
=
\text{probability we correctly reject} H\_0
\\\\&
=
P\left( \text{reject } H\_0 \mid H\_{a} \right)
\\\\&
=
1 - P\left( \text{don't reject } H\_0 \mid H\_{a} \right)
\\\\&
=
1 - \beta
\\\\&
=
1 - P\left( \text{Type II error} \right)
\end{align}
$$

We don’t have as much control over this probability, since the
flexibility was spent guaranteeing that the Type I error rate, i.e
*a**l**p**h**a* is small.

One way to the control of power is at the design phase, by picking a
large enough sample size so that we’d be likely to reject if the
alternative is true. Thus the most frequent use of power is to help us
design studies.

## Calculating power for Gaussian data

Assume *X̄* is normal distributed and *σ* is known. Then, we reject if
$\frac{\bar{X}-30}{\sigma/\sqrt{n}} &gt; z\_{1-\alpha}$

Equivalently, we reject if

$$
\bar{X} &gt; 30 + z\_{1-\alpha} \frac{\sigma}{\sqrt{n}}
$$
Under
$H\_{0} : \bar{X} \sim \text{Normal}\left(x \mid \mu\_0, \frac{\sigma^2}{n} \right)$

Under
$H\_{0} : \bar{X} \sim \text{Normal}\left(x \mid \mu\_{a}, \frac{\sigma^2}{n} \right)$

    mu0 = 30
    mua = 32
    sigma = 4
    n = 16
    alpha = 0.05
    z <- qnorm(1-alpha)
    pnorm(mu0 + z * sigma/sqrt(n), mean = mu0, sd = sigma/sqrt(n), lower.tail = FALSE)

    ## [1] 0.05

    pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE)

    ## [1] 0.63876

    library(ggplot2)
    nvals <- 2**c(3,4,5,6,7)
    mus = seq(30,35,by = 0.01)
    sigma = 4
    alpha = 0.05
    r <- vector()
    colnames <- 
    for(n in nvals){
        pws <- pnorm(mu0 + z * sigma/sqrt(n), mean = mus, sd = sigma/sqrt(n), lower.tail = FALSE)
        r <- cbind(r, pws)
    }
    colnames(r) <- paste('n=',as.character(nvals), sep = '')
    df <- stack(as.data.frame(r))
    df$x <- rep(mus, by = length(nvals))

    qplot(x, values, data = df, group = ind, colour = ind, geom = "line")

    ## Warning: `qplot()` was deprecated in ggplot2 3.4.0.

![](Notes4_files/figure-markdown_strict/unnamed-chunk-2-1.png)

When testing *H*<sub>*a*</sub> : *μ* &gt; *μ*<sub>0</sub>:
$$
\begin{align}
1 - \beta
=
P
\left(
\bar{X} &gt; \mu\_0 + z\_{1-\alpha}\frac{\sigma}{\sqrt{n}}
\mid
\mu 
=
\mu\_{a}
\right)
\end{align}
$$
where

-   $\bar{X} \sim \text{Normal}\left( \mu\_{a}, \frac{\sigma^2}{n}\right)$
-   The unknowns are : *μ*<sub>*a*</sub>, *σ*, *n*, *β*,
-   Knowns: *μ*<sub>0</sub>, *α*

Specify any 3 of the unkowns and you can solve for the remainder.

-   As *α* gets larger, the power gets larger.
-   The power of a one sided test is greater than the power of the
    associated two sided test
-   Power goes up as *μ*<sub>*a*</sub> gets further away from
    *μ*<sub>0</sub>
-   Power goes up as *n* goes up
-   Power doesn’t need *μ*<sub>*a*</sub>, *σ* and *n*, instead only
    $\frac{\sqrt{n}(\mu\_a - mu)}{\sigma}$
    -   The quantity $\frac{(\mu\_a - mu)}{\sigma}$ is called the
        **effect size**

## *t*-test power

-   Consider calculating power for a *t* test for our example
-   The power is:

$$
\begin{align}
P
\left(
\frac{\bar{X}-\mu\_0}{S/\sqrt{n}} &gt;  t\_{1-\alpha\\; n-1 }
\mid
\mu 
=
\mu\_{a}
\right)
\end{align}
$$
Calculating this requres the non-central *t* distribution.

`power.t.test` does this very well

### Examples

-   `delta` is specifying the difference in the means
-   `type` is specifying it’s one sample t test
-   `alt` is specifying the alternative, in this case one sided test,
    hence we test for *H*<sub>*a*</sub> : *μ* &gt; *m**u*<sub>*a*</sub>

All the following examples compute the power and produce the same
result, since $\frac{\sqrt{n}(\mu\_a - mu)}{\sigma}$ is the same in all
cases

    power.t.test(n = 16, delta = 2, sd = 4, type = 'one.sample', alt = 'one.sided')$power

    ## [1] 0.6040329

    power.t.test(n = 16, delta = 2/4, sd = 1, type = 'one.sample', alt = 'one.sided')$power

    ## [1] 0.6040329

    power.t.test(n = 16, delta = 100, sd = 200, type = 'one.sample', alt = 'one.sided')$power

    ## [1] 0.6040329

All the following examples compute the sample size and produce the same
power, since $\frac{\sqrt{n}(\mu\_a - mu)}{\sigma}$ is the same in all
cases

    power.t.test(power = 0.8, delta = 2/4, sd = 1, type = 'one.sample', alt = 'one.sided')$n

    ## [1] 26.13751

    power.t.test(power = 0.8, delta = 2, sd = 4, type = 'one.sample', alt = 'one.sided')$n

    ## [1] 26.13751

    power.t.test(power = 0.8, delta = 100, sd = 200, type = 'one.sample', alt = 'one.sided')$n

    ## [1] 26.13751

# Module 12: Multiple Comparisons

Key ideas: \* Hypothesis testing/significance analysis is commonly
overused \* Correcting for multiple testing avoids fals positives or
discoveres

Two key components:

-   Error measure
-   Correction

### The three eras of statistics (Efron)

1 The age of Quetelet and his successors, in which huge census-level
data sets were brought to bear on simple but important questions: Are
there more male than female births? Is the rate of insanity rising?

2 The classical period of Pearson, Fisher, Neyman, Hotelling, and their
successors, intellectual giants who developed a theory of optimal
inference capable of wringing every drop of information out of a
scientific experiment. The questions dealt with still tended to be
simple — Is treatment A better than treatment B? — but the new methods
were suited to the kinds of small data sets individual scientists might
collect.

3 The era of scientific mass production, in which new technologies
typified by the microarray allow a single team of scientists to produce
data sets of a size Quetelet would envy. But now the flood of data is
accompanied by a deluge of questions, perhaps thousands of estimates or
hypothesis tests that the statistician is charged with answering
together; not at all what the classical masters had in mind.

## Types of errors

Suppose you are testing a hypothesis that a parameter *β* eqauls to zero
versus the alternative that it does not equal zero. There the possible
outcoms

<table>
<thead>
<tr class="header">
<th style="text-align: center;"></th>
<th style="text-align: center;"><span
class="math inline"><em>β</em> = 0</span></th>
<th style="text-align: center;"><span
class="math inline"><em>β</em> ≠ 0</span></th>
<th style="text-align: center;">hypothesis</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">Claim <span
class="math inline"><em>β</em> = 0</span></td>
<td style="text-align: center;"><span
class="math inline"><em>U</em></span></td>
<td style="text-align: center;"><span
class="math inline"><em>T</em></span></td>
<td style="text-align: center;"><span
class="math inline"><em>m</em> − <em>R</em></span></td>
</tr>
<tr class="even">
<td style="text-align: center;">Claim <span
class="math inline"><em>β</em> ≠ 0</span></td>
<td style="text-align: center;"><span
class="math inline"><em>V</em></span></td>
<td style="text-align: center;"><span
class="math inline"><em>S</em></span></td>
<td style="text-align: center;"><span
class="math inline"><em>R</em></span></td>
</tr>
<tr class="odd">
<td style="text-align: center;">Claims</td>
<td style="text-align: center;"><span
class="math inline"><em>m</em><sub><em>s</em></sub></span></td>
<td style="text-align: center;"><span
class="math inline"><em>m</em> − <em>m</em><sub><em>s</em></sub></span></td>
<td style="text-align: center;"><span
class="math inline"><em>m</em></span></td>
</tr>
</tbody>
</table>

**Type I error** or **false positive** (V): Decide that the parameter
does not equal to zero when it actually does.

**Type II error** or **false negative** (T): Decide that the parameter
equals to zero when it actually does not.

## Error rates

**False positive rate** - the rate at which false results are called
significant $\mathbb{E}\left\[ \frac{V}{m\_0} \right\]$.

-   The false positive rate is closely related to the Type I error rate.

**Family wise error rate (FWER)** - the probabilty of at least one false
positive *P*(*V*≥1)

**False discovery rate (FDR)** - the rate at which claims of
significance are false $\mathbb{E}\left\[\frac{V}{R} \right\]$

### Controling the false positive rate

If *p*-values are correctly calculated calling all *p* &lt; *α*
significant will control the false positive rate at level *α* on
average.

**Problem**: Suposse you perfom 10000 tests and *β* = 0 for all of them.
Suppose that you call *p* &lt; 0.05 significant. The expected number of
false positive is 10000 × 0.05 = 500 false positives. How do we avoid so
many false positives?

### Controling family-wise error rate (FWER)

The **Bonferroni correction** is the oldest multiple testing correction:

Basic idea:

-   Suppose you do *m* tests.
-   You want to control FWER at level *α* so *P*(*V*≥1) &lt; *α*.
-   Calculate the *p*-values normally.
-   Set $\alpha\_{\text{FEWR}} = \frac{\alpha}{m}$.
-   Call all *p*-values smaller than *α*<sub>FEWR</sub> significant.

**Pros:** Easy to calculate & conservative.

**Cons:** May be very conservative.

### Controling false discover rate (FDR)

The **Benjamini–Hochberg** procedure can be used.

Basic idea:

-   Suppose you do *m* tests.
-   You want to control FDR at level *α* so
    $\mathbb{E}\left\[ \frac{V}{R} \right\] &lt; \alpha$.
-   Calculate the *p*-values normally.
-   Order the *p*-values from smallest to largest
    *p*<sub>(1)</sub>, …, *p*<sub>(*m*)</sub>.
-   Call any $p\_{(i)} \leq \frac{i}{m} \alpha$ significant

**Pros:** Easy to calculate, less conservative.

**Cons:** Allows for more false positives, may behave strangely under
dependence.

### Adjusted *p*-values

-   One approach is to **adjust** the threshold *α*

-   A different approach is to calculate **adjusted *p*- values**:

    -   The adjusted *p*-values are not *p*-values anymore, so they
        should not be treated as *p*-values.
    -   They can be used directly without adjusting *α*.

-   **Case study I:** No true positives

    -   Suppose *p*-values are *p*<sub>1</sub>, …, *p*<sub>*m*</sub>.
    -   They can be adjusted by taking
        *p*<sub>*i*</sub><sup>FWER</sup> = max {*m*×*p*<sub>*i*</sub>, 1}
    -   Calling all *p*<sub>*i*</sub><sup>FWER</sup> &lt; *α*
        significat, will control the family-wise error rate (FWER).

<!-- -->

    set.seed(42)
    n = 1000
    alpha = 0.05
    pValues <- rep(NA, n)
    for(i in 1:n){
        y <- rnorm(20)
        x <- rnorm(20)
        pValues[i] <- summary(lm(y~x))$coef[2,4]
    }
    sum(pValues < alpha)

    ## [1] 57

    # controls FWER
    sum(p.adjust(pValues, method = 'bonferroni') < alpha )

    ## [1] 0

    # controls FDR
    sum(p.adjust(pValues, method = 'BH') < alpha )

    ## [1] 0

-   **Case study II:** No true positives

<!-- -->

    set.seed(42)
    n = 1000
    alpha = 0.05
    pValues <- rep(NA, n)
    for(i in 1:n){
        x <- rnorm(20)
        if(i <= 500){
            y <- rnorm(20)
        }
        else{
            y <- rnorm(20, mean = 2*x)
        }
        pValues[i] <- summary(lm(y~x))$coef[2,4]
    }
    trueStatus <- rep(c('zero', 'not zero'), each = 500)
    table(pValues < alpha, trueStatus)

    ##        trueStatus
    ##         not zero zero
    ##   FALSE        0  467
    ##   TRUE       500   33

    # controls FWER
    table(p.adjust(pValues, method = 'bonferroni') < alpha , trueStatus)

    ##        trueStatus
    ##         not zero zero
    ##   FALSE       29  500
    ##   TRUE       471    0

    # controls FDR
    table(p.adjust(pValues, method = 'BH') < alpha , trueStatus)

    ##        trueStatus
    ##         not zero zero
    ##   FALSE        0  483
    ##   TRUE       500   17

    par(mfrow = c(1,2))
    plot(pValues, p.adjust(pValues, method = 'bonferroni'), pch = 19)
    plot(pValues, p.adjust(pValues, method = 'BH'), pch = 19)

![](Notes4_files/figure-markdown_strict/unnamed-chunk-15-1.png)

# Module 13: Resampling

## The Bootstrap

-   The **bootstrap** is a very useful tool for construction confidence
    intervals and calculating standard errors for difficult statistics.

-   **Question: ** How would one derive a confidence interval for the
    mean, median or some other statistic?

For a die roll, having the information about its distribution (say a
fair die, i.e. equal probabilities for each face) allows us to use
simulations to infer the behavior of the average. We can simply generate
samples (specifically because we know the distribution) compute each
sample mean and obtain samples of the average.

    nsample <- 50
    nexperiments <- 1000
    mu <- c()
    for(i in 1:nexperiments){
    dieroll <- sample(1:6, nsample, replace = TRUE)
    mu <- c(mu, mean(dieroll))
    }

    par(mfrow = c(1,2))
    hist(dieroll, 
         breaks = seq(.5, 6.5, length = 7), 
         freq = FALSE,
         col = yarrr::transparent('sienna3', .6))
    hist(mu, 
         breaks = seq(min(mu), max(mu), length = 9), 
         freq = FALSE,
         col = yarrr::transparent('goldenrod3', .6))

![](Notes4_files/figure-markdown_strict/unnamed-chunk-16-1.png)

The case where the distribution is unknown can’t be handled like this.
If one sample is available, but the underlying distribution is unknown,
generating more samples is not possible so the unique available sample
can be used to obtain just one average sample. The bootstrap method
deals with this situation, by samplying for the empirical distribution
(not the population distribution).

### Example

    library(UsingR)

    ## Loading required package: MASS

    ## Loading required package: HistData

    ## Loading required package: Hmisc

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## 
    ## Attaching package: 'Hmisc'

    ## The following objects are masked from 'package:base':
    ## 
    ##     format.pval, units

    ## 
    ## Attaching package: 'UsingR'

    ## The following object is masked from 'package:survival':
    ## 
    ##     cancer

    data(father.son)
    x <- father.son$sheight
    n <- length(x)
    B <- 10000

    resamples <- matrix(sample(x, n*B, replace = TRUE), B, n)
    resampledMedians <- apply(resamples, 1, median)
    den <- density(resampledMedians)
    plot(density(resampledMedians)$x,
         density(resampledMedians)$y, 
         type = 'l', lwd = 2, col = 'black',
         xlab = 'x', ylab = 'density')
    polygon(density(resampledMedians)$x,
            density(resampledMedians)$y, 
            col = "slateblue1")
    abline(v = median(x),  lwd = 3, col = 'black')
    title(main = 'Bootstrap density')

![](Notes4_files/figure-markdown_strict/unnamed-chunk-17-1.png)

## The Bootstrap principle

Suppose that a statistic that estimates some population parameter is
available, but the statistic’s sample distribution is unknown.

The bootstrap principle suggests using the distribution defined by the
data (i.e. the empirical distribution) to approximate its sampling
distribution.

The general procedure follows by first simulating complete data sets
from the observe data **with replacement**

-   This is approximately drawing from the sampling distribution of that
    statistic, at least as far as the data is able to approximate the
    true population distribution.

Calculate the statistic for each simulated data set.

Use the simulated statistics to either define a confidence interval or
take the standard deviation to calculate a standard error.

## Nonparameteric bootstrap algorithm example

Bootstrap procedure for calculating confidence interval for the median
from a data set of *n* observations.

1.  Sample *n* observaion **with replacement** from the observed data
    resulting in one simulated complete data set.

2.  Take the median of the simulated data set.

3.  Repeat these two steps B times, resulting in B simulated medians.

    -   B should be set fairly large, so the Monte-Carlo error is small.

4.  These medians are approximately drawn from the sampling distribution
    of the median of *n* observations. Therefore we can

    -   Draw a histogram of them.
    -   Calculate their standard deviation to estimate the standard
        error of the median.
    -   Take the 2.5th and 97.5th percentils as a confidence interval
        for the median.

### Example code

    library(UsingR)
    data(father.son)
    x <- father.son$sheight
    n <- length(x)
    B <- 10000

    resamples <- matrix(sample(x, n*B, replace = TRUE), B, n)
    medians <- apply(resamples, 1, median)
    sd(medians)

    ## [1] 0.08560373

    quantile(medians, c(0.025, 0.975))

    ##     2.5%    97.5% 
    ## 68.43733 68.81579

    g = ggplot(data.frame(medians = medians), aes(x = medians))
    g = g + geom_histogram(color = 'black', fill = 'lightblue', binwidth = 0.05)
    g

![](Notes4_files/figure-markdown_strict/unnamed-chunk-19-1.png)

### Notes on the bootstrap

-   The bootstrap is non-parametric
-   Better percentile bootstrap CI correct for bias (BCA interval)
-   There are lot of variations on bootstrap procedure; \* *An
    Introduction to the Bootstrap* by *Efron* and *Tibshirani*.

## Permutation tests

Permutation tests are used for group comparisons.

### Group comparisons example

Comparing sprays B and C

-   Consider the null hypothesis that the distribution of the
    observations from each group is the same.
-   Then, the group labels are irrelvant.
-   Consider a data formed with count and spary
-   Permute the spary (group) labels.
-   Recalculate the statistic:
    -   Mean difference in counts.
    -   Geometric means.
    -   *t* statistic.
-   Calculate the percentage of simulations where the simulated
    statistic was more extreme (towards the alternative) than the
    observed.

### Variations on perumation testing

<table>
<thead>
<tr class="header">
<th style="text-align: center;">Data Type</th>
<th style="text-align: center;">Statistic</th>
<th style="text-align: center;">Test Name</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">Ranks</td>
<td style="text-align: center;">rank sum</td>
<td style="text-align: center;">rank sum test</td>
</tr>
<tr class="even">
<td style="text-align: center;">Binary</td>
<td style="text-align: center;">hypergeometric prob</td>
<td style="text-align: center;">Fisher’s exact test</td>
</tr>
<tr class="odd">
<td style="text-align: center;">Raw data</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ordinary permutation test</td>
</tr>
</tbody>
</table>

-   The so-called *randomization tests* are exactly permutation tests,
    with a different motivation

-   For matched data, one can randomize the signs

    -   For ranks, this resutls in the signed rank test.

-   Permuation strategies work for regression as well

    -   Permuting a regressor of interest

-   Permutation tests work very well in multivarate setting

### Permutation test B vs. C

    subdata <- InsectSprays[InsectSprays$spray %in% c('B', 'C'),]
    head(subdata)

    ##    count spray
    ## 13    11     B
    ## 14    17     B
    ## 15    21     B
    ## 16    11     B
    ## 17    16     B
    ## 18    14     B

    y <- subdata$count
    group <- as.character(subdata$spray)
    testStat <- function(w, g) mean(w[ g == 'B']) - mean(w[g == 'C'])
    observedStat <- testStat(y, group)
    observedStat

    ## [1] 13.25

    permutations <- sapply(1:10000, function(i) testStat(y, sample(group)))
    mean(permutations > observedStat)

    ## [1] 0

    g = ggplot(data.frame(permutations = permutations), aes(x = permutations))
    g = g + geom_histogram(color = 'black', fill = 'lightblue', binwidth = 0.5) + geom_vline(xintercept = observedStat, size=1.5)

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.

    g

![](Notes4_files/figure-markdown_strict/unnamed-chunk-20-1.png)
