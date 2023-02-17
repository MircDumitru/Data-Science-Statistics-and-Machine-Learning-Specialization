



-   <a href="#module-5-variability" id="toc-module-5-variability">Module 5:
    Variability</a>
    -   <a href="#the-variance" id="toc-the-variance">The Variance</a>
        -   <a href="#example---rolling-a-die-variance"
            id="toc-example---rolling-a-die-variance">Example - Rolling a Die
            Variance</a>
        -   <a href="#example---unfair-coin-toss-variance"
            id="toc-example---unfair-coin-toss-variance">Example - Unfair Coin Toss
            Variance</a>
    -   <a href="#the-sample-variance" id="toc-the-sample-variance">The Sample
        Variance</a>
        -   <a href="#sample-variance-from-zero-mean-normal-distribution"
            id="toc-sample-variance-from-zero-mean-normal-distribution">Sample
            Variance from Zero Mean Normal Distribution</a>
        -   <a href="#variance-of-n-die-rolls"
            id="toc-variance-of-n-die-rolls">Variance of <span
            class="math inline"><em>n</em></span> die rolls</a>
    -   <a href="#the-standard-error-of-the-mean"
        id="toc-the-standard-error-of-the-mean">The Standard Error of the
        Mean</a>
    -   <a href="#summary" id="toc-summary">Summary</a>
        -   <a href="#simulation-examples" id="toc-simulation-examples">Simulation
            examples</a>
-   <a href="#module-6-distributions" id="toc-module-6-distributions">Module
    6: Distributions</a>
    -   <a href="#the-bernoulli-distribution"
        id="toc-the-bernoulli-distribution">The Bernoulli distribution</a>
    -   <a href="#the-binomial-distribution"
        id="toc-the-binomial-distribution">The Binomial distribution</a>
    -   <a href="#the-normal-distribution" id="toc-the-normal-distribution">The
        normal distribution</a>
        -   <a href="#facts-about-the-normal-density"
            id="toc-facts-about-the-normal-density">Facts about the Normal
            density</a>
        -   <a href="#example" id="toc-example">Example</a>
    -   <a href="#the-poisson-distributed" id="toc-the-poisson-distributed">The
        Poisson distributed</a>
        -   <a href="#rates-and-poisson-random-variables"
            id="toc-rates-and-poisson-random-variables">Rates and Poisson random
            variables</a>
        -   <a href="#example-1" id="toc-example-1">Example</a>
        -   <a href="#poisson-approximation-to-the-binomial"
            id="toc-poisson-approximation-to-the-binomial">Poisson approximation to
            the binomial</a>
        -   <a href="#example-2" id="toc-example-2">Example</a>
-   <a href="#module-7-asymptotics" id="toc-module-7-asymptotics">Module 7:
    Asymptotics</a>
    -   <a href="#the-law-of-large-numbers"
        id="toc-the-law-of-large-numbers">The Law of Large Numbers</a>
        -   <a href="#example-of-lln-in-action-standard-normal-distribution"
            id="toc-example-of-lln-in-action-standard-normal-distribution">Example
            of LLN in action, standard normal distribution</a>
        -   <a href="#example-of-lln-in-action-bernoulli-distribution-coin-flip"
            id="toc-example-of-lln-in-action-bernoulli-distribution-coin-flip">Example
            of LLN in action, Bernoulli distribution (coin flip)</a>
        -   <a href="#discussion" id="toc-discussion">Discussion</a>
    -   <a href="#the-central-limit-theorem"
        id="toc-the-central-limit-theorem">The Central Limit Theorem</a>
        -   <a href="#example-simulate-a-standrd-normal-by-die-rolling"
            id="toc-example-simulate-a-standrd-normal-by-die-rolling">Example:
            Simulate a standrd normal by die rolling</a>
        -   <a href="#example-coin-flipping" id="toc-example-coin-flipping">Example
            coin flipping</a>
    -   <a href="#confidence-intervals" id="toc-confidence-intervals">Confidence
        intervals</a>
        -   <a href="#example-father-son-data"
            id="toc-example-father-son-data">Example Father Son Data</a>
        -   <a href="#example-binomial-proportion-confidence-interval"
            id="toc-example-binomial-proportion-confidence-interval">Example:
            Binomial proportion confidence interval</a>
        -   <a href="#example-binomial-proportion-confidence-interval-1"
            id="toc-example-binomial-proportion-confidence-interval-1">Example:
            Binomial proportion confidence interval</a>
        -   <a href="#example-3" id="toc-example-3">Example</a>
        -   <a href="#poisson-interval" id="toc-poisson-interval">Poisson
            interval</a>
    -   <a href="#summary-1" id="toc-summary-1">Summary</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Module 5: Variability

-   One important characterization of a population is *how spread out*
    it is.
-   One key measure of spread is *variance*, measured with the sample
    variance, or the *standard deviation*.
-   The standard deviation has the same units as the population
    (different from the variance).
-   The variance is itself an intrinsically interesting quantity that we
    want to estimate. Also, the variance of our estimates is what makes
    them not imprecise. An important aspect of statistics is quantifying
    the variability in the estimates (uncertainty quantification).

## The Variance

The **variance** of a random variable is a measure of spread. It
measures how fat or how thin or how spread out or how concentrated is
the distribution.

The variance of a random variable *X* with mean *μ* is defined as the
expected value of its squared distance from the mean

$$
\begin{align}
\mathbb{V}\left\[ X \right\]
=
\mathbb{E}\left\[ \left( X - \mu \right)^2 \right\]
\end{align}
$$

Accounting for the fact that *μ* = 𝔼\[*X*\] it can be easily proven
that:

$$
\begin{align}
\mathbb{V}\left\[ X \right\]
&
=
\mathbb{E}\left\[ \left( X - \mathbb{E}\left\[ X \right\] \right)^2 \right\]
\\\\
&
=
\mathbb{E}\left\[ X^2 - 2 X \mathbb{E}\left\[ X \right\] +
\mathbb{E}\left\[ X \right\]^2 \right\]
\\\\
&
=
\mathbb{E}\left\[ X^2 \right\]
- 
2 \mathbb{E}\left\[ X \right\] \mathbb{E}\left\[ X \right\] 
+
\mathbb{E}\left\[ X \right\]^2
\\\\
&
=
\mathbb{E}\left\[ X^2 \right\]
-
\mathbb{E}\left\[ X \right\]^2
\end{align}
$$

The densities with higher variances are more spread out than the
densities with lower variances.

The square root of the variance is called the **standard deviation**.

The variance is expressed in units squared, while the standard deviation
is expressed in the same units as the random variable *X*.

### Example - Rolling a Die Variance

What is the variance from the result of rolling a die?

$$
\begin{align}
&
\mathbb{E}\left\[ X \right\] = 3.5
\\\\
&
\mathbb{E}\left\[ X^2 \right\] = \sum\_{i = 1}^{6} i^2 \frac{1}{6} = 15.17
\\\\
&
\mathbb{V}\left\[ X \right\]
=
\mathbb{E}\left\[ X^2 \right\]
-
\mathbb{E}\left\[ X \right\]^2
=
15.17 - (3.5)^2 
=
2.92.
\end{align}
$$

### Example - Unfair Coin Toss Variance

What is the variance from the result of the toss of a coin with
probability of heads (1) of *p*?

$$
\begin{align}
&
\mathbb{E}\left\[ X \right\] = p
\\\\
&
\mathbb{E}\left\[ X^2 \right\] = p
\\\\
&
\mathbb{V}\left\[ X \right\] = p - p^2 = p(1-p)
\end{align}
$$

    x <- seq(-10, 10, 0.1)
    par(bty="l")
    plot(x, dnorm(x, 0, 1), type = 'l',
         lwd = '3', col = 'maroon2', 
         xlab = '', ylab = '')
    lines(x, dnorm(x, 0, 2), 
          lwd = '3', col = 'olivedrab3')
    lines(x, dnorm(x, 0, 3), 
          lwd = '3', col = 'cyan3')
    lines(x, dnorm(x, 0, 4), 
          lwd = '3', col = 'orchid4')
    legend('topright', 
           legend = c('var = 1', 'var = 2', 'var = 3', 'var = 4'),
           col = c('maroon2', 'olivedrab3', 'cyan3', 'orchid4'),
           bty = "n", lty = 1, lwd = '3')
    title('Normal Distributions with increasing variance')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-1-1.png)

## The Sample Variance

The sample variance is

$$
\begin{align}
S^2 
=
\frac{1}{n-1}
\sum\_{i = 1}^{n} \left(X\_i - \bar{X} \right)^2
\end{align}
$$

### Sample Variance from Zero Mean Normal Distribution

    n <- 100000
    xVar10 <- tapply(rnorm(n, mean=0, sd = 1), 
                     rep(1:n/10, each = 10, length.out = n), 
                     var)

    n <- 200000
    xVar20 <- tapply(rnorm(n, mean=0, sd = 1), 
                     rep(1:n/20, each = 20, length.out = n), 
                     var)

    n <- 300000
    xVar30 <- tapply(rnorm(n, mean=0, sd = 1), 
                     rep(1:n/30, each = 30, length.out = n), 
                     var)

    xmin <- min(c(density(xVar10)$x, density(xVar20)$x, density(xVar30)$x))
    xmax <- max(c(density(xVar10)$x, density(xVar20)$x, density(xVar30)$x))

    ymin <- min(c(density(xVar10)$y, density(xVar20)$y, density(xVar30)$y))
    ymax <- max(c(density(xVar10)$y, density(xVar20)$y, density(xVar30)$y))

    par(bty="l")
    plot(density(xVar10)$x, density(xVar10)$y, 
         type = 'l', lwd = '3',
         xlab = '', ylab = 'Density',
         xlim = c(xmin, xmax), ylim = c(ymin, ymax))
    lines(density(xVar20)$x, density(xVar20)$y, 
         type = 'l', lwd = '3')
    lines(density(xVar30)$x, density(xVar30)$y, 
         type = 'l', lwd = '3')

    polygon(density(xVar10), 
            col = yarrr::transparent('maroon2', .6))
    polygon(density(xVar20), 
            col = yarrr::transparent('cyan2', .6))
    polygon(density(xVar30),
            col = yarrr::transparent('orchid4', .6))

    abline(v = 1, lwd = '3')
    legend('topright', 
           legend = c('var = 10', 'var = 20', 'var = 30'),
           col = c('maroon2', 'cyan2', 'orchid4'),
           bty = "n", lty = 1, lwd = '3')
    title('Sample Variance from Zero Mean Normal Distribution')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-2-1.png)

### Variance of *n* die rolls

    n <- 100000
    xVar10 <- tapply(x <- sample(1:6, n, replace = TRUE),
                     rep(1:n/10, each = 10, length.out = n), 
                     var)
    n <- 200000
    xVar20 <- tapply(x <- sample(1:6, n, replace = TRUE),
                     rep(1:n/20, each = 20, length.out = n), 
                     var)
    n <- 300000
    xVar30 <- tapply(x <- sample(1:6, n, replace = TRUE),
                     rep(1:n/30, each = 30, length.out = n), 
                     var)

    par(mfrow = c(1, 3))
    hist(xVar10, breaks = seq(0, 7, 0.25), 
         freq = TRUE, 
         col = yarrr::transparent('maroon2', .6))
    abline(v = 2.92, lwd = 3)

    hist(xVar20, breaks = seq(0, 7, 0.25), 
         freq = TRUE,
         col = yarrr::transparent('cyan2', .6))
    abline(v = 2.92, lwd = 3)

    hist(xVar30, breaks = seq(0, 6, 0.25), 
         freq = TRUE,
         col = yarrr::transparent('orchid4', .6))
    abline(v = 2.92, lwd = 3)

    mtext(expression(bold("Variances of Die Rolling")),
          side = 3,
          line =  -1.5,
          outer = TRUE)

![](Notes2_files/figure-markdown_strict/unnamed-chunk-3-1.png)

Recall that the average of a random sample from a population is itself a
random variable, which is unbiased, i.e. it’s expected mean is the
population mean.

𝔼\[*X̄*\] = *μ*.

It’s variance is also related to the population variance, via the number
of samples *n*:

$$
\mathbb{V} 
\left\[ \bar{X} \right\]
=
\frac{\sigma^2}{n}
.
$$
The above relation show that the sample mean variance is decreasing to
zero as the data accumulates, which is exactly what we observed in the
simulations, where the sample mean becomes more and more precise
(i.e. more concentrated around the population mean) as we collect more
data and consequently, its corresponding variance gets closer to zero.

## The Standard Error of the Mean

The square root of the statistic above (i.e. the mean) is
$\sigma / \sqrt{n}$ is called the **standard error of the mean**:

$$
\text{Standard Error of the Mean }
=
\sqrt{\mathbb{V} 
\left\[ \bar{X} \right\]}
=
\frac{\sigma}{\sqrt{n}}
$$

In general the standard deviation of a statistic (the mean or any other
statistic) is called the **standard error**. The standard error of the
mean introduced above refers to the number associated with the
variability of the mean estimation. The standard error of the regression
coefficients referes to the number associated with the number associated
with the variability of the coeficients estimation.

## Summary

For a population with the parameters

-   the mean *μ*,
-   the variance *σ*<sup>2</sup>,

a random sample from that population has the corresponding sample mean
and sample variance given by

-   $\bar{X} = \frac{1}{N} \sum\_{i}^{N} X\_{i}$,
-   $S^2 = \frac{1}{N-1} \sum\_{i}^{N} \left( X\_{i} - \bar{X} \right)^2$.

The sample mean *x̄* is a random variable itself for which we can
consider its corresponding mean and variance. The mean of the sample
mean is the population mean *μ* (i.e. the sample mean is an unbiased
estimator) and the variance of the sample mean is *σ*<sup>2</sup>/*n*,
where *n* represents the number of samples in the random sample

-   𝔼\[*X̄*\] = *μ*,
-   $\mathbb{V}\left\[\bar{X}\right\] = \frac{\sigma^2}{n}$.

The standard error of the mean (SEM) is defined as the square root of
the variance of the sample mean:

-   $\text{SEM} = \frac{\sigma}{\sqrt{n}}$

The population mean *μ* or the population variance *σ*<sup>2</sup> are
typically **unknown**, hence an estimate of the SEM is obtained via the
**sample standard error of the mean** (SSEM), via *S*<sup>2</sup>:

-   $\text{SSEM} = \frac{S}{\sqrt{n}}$.

The sample variance (or the sample standard deviation) (*S*<sup>2</sup>)
and the sample standard error of the mean (SSEM) are measures of
different spreads:

-   the sample standard deviation *S*<sup>2</sup> is an estimation based
    on the available sample about how variable the population is.
-   the sample standard error of the mean (SSEM) is an estimation based
    on the available sample about how variable the averages of random
    samples of size *n* from the population are.

### Simulation examples

#### Standard normal distribution

-   Standard normal distribution has a variance of 1.
-   The mean (average) of *n* standard normal distributions has a
    standard deviation of $1/\sqrt{12 \* n}$.

<!-- -->

    nosim <- 1000
    n <- 10
    theoretical_sd <- 1/sqrt(n)
    x <- rnorm(nosim*n)
    simulated_sd <- sd(tapply(x,rep(seq_along(x), each = n, length.out = length(x)), mean))
    cat(paste('Theoretical sd: ', theoretical_sd, '\nSimulated sd: ', simulated_sd))

    ## Theoretical sd:  0.316227766016838 
    ## Simulated sd:  0.308876790187551

#### Standard uniform distribution

-   Standard uniform distribution has a variance of 1/2.
-   The mean (average) of *n* standard normal distributions has a
    standard deviation of $1/\sqrt{n}$.

<!-- -->

    nosim <- 1000
    n <- 10
    theoretical_sd <- 1/sqrt(12 *n)
    x <- runif(nosim*n)
    simulated_sd <- sd(tapply(x,rep(seq_along(x), each = n, length.out = length(x)), mean))
    cat(paste('Theoretical sd: ', theoretical_sd, '\nSimulated sd: ', simulated_sd))

    ## Theoretical sd:  0.0912870929175277 
    ## Simulated sd:  0.0903154735190061

#### Poisson distribution

-   Poisson distribution with rate *λ* has a variance of *λ*.
-   The means (averages) of *n* Poisson distributions with rate *λ* has
    a standard deviation of $\sqrt{\lambda/n}$.
-   The following is a simulation for *λ* = 4.

<!-- -->

    nosim <- 1000
    n <- 10
    lambda <- 4
    theoretical_sd <- sqrt(lambda / n)
    x <- rpois(nosim*n, lambda)
    simulated_sd <- sd(tapply(x,rep(seq_along(x), each = n, length.out = length(x)), mean))
    cat(paste('Theoretical sd: ', theoretical_sd, '\nSimulated sd: ', simulated_sd))

    ## Theoretical sd:  0.632455532033676 
    ## Simulated sd:  0.634892154659394

#### Bernoulli (coin flip) distribution

-   Bernoulli distribution with parameter *p* has a variance of
    *p*(1−*p*).
-   The means (averages) of *n* Bernoulli distributions with parameter
    *p* has a standard deviation of $\sqrt{p(1-p)/n}$.
-   The following is a simulation for *p* = 1/2 (fair coin).

<!-- -->

    nosim <- 1000
    n <- 10
    p <- 1/2
    theoretical_sd <- sqrt(p * (1-p) / n)
    x <- rbinom(nosim*n, 1, 1/2)
    simulated_sd <- sd(tapply(x,rep(seq_along(x), each = n, length.out = length(x)), mean))
    cat(paste('Theoretical sd: ', theoretical_sd, '\nSimulated sd: ', simulated_sd))

    ## Theoretical sd:  0.158113883008419 
    ## Simulated sd:  0.161033915439954

#### Data example

    library(UsingR)

    ## Loading required package: MASS

    ## Loading required package: HistData

    ## Loading required package: Hmisc

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## Loading required package: ggplot2

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
    head(father.son)

    ##    fheight  sheight
    ## 1 65.04851 59.77827
    ## 2 63.25094 63.21404
    ## 3 64.95532 63.34242
    ## 4 65.75250 62.79238
    ## 5 61.13723 64.28113
    ## 6 63.02254 64.24221

    x <- father.son$sheight
    n <- length(x)

    hist(x, col = yarrr::transparent('maroon2', .6), freq = FALSE)
    lines(density(x), lwd = 3, col = 'black')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-8-1.png)

    round(c(var(x), var(x)/n, sd(x), sd(x)/sqrt(n)), 2)

    ## [1] 7.92 0.01 2.81 0.09

# Module 6: Distributions

## The Bernoulli distribution

The Bernoulli distribution is a discrete distribution modelling the coin
flip. Its support is {0,1}. It has one parameter *p* ∈ \[0,1\], the
probability of taking the value 1. It’s probability mass function is

*f*(*k*∣*p*) = *P*(*X*=*k*∣*p*) = *p*<sup>*k*</sup>(1−*p*)<sup>1 − *k*</sup>,  *k* = {0,1}.
The mean and the variance of a Bernoulli distributed random variable *X*
are:
$$
\begin{align}
\mathbb{E}\left\[ X \right\] 
&
= 
1 \times p + 0 \times (1-p)
=
p
\\\\
\mathbb{V}\left\[ X \right\] 
&
=
\mathbb{E}\left\[ X^2 \right\] - \mathbb{E}\left\[ X \right\]^2 
=
p - p^2 
= 
p(1-p)
\end{align}
$$

## The Binomial distribution

A Binomial random variable is obtained as the sum of Bernoulli random
variables. If *X*<sub>1</sub>, …, *X*<sub>*n*</sub> are Bernoulli random
variables with parameter *p*, then
*X* = *s**u**m*<sub>*i* = 1</sub><sup>*n*</sup> is a Binomial random
variable with *n* number of trails and success probability *p*
$$
\begin{align}
X\_1, \ldots, X\_n 
\sim 
\text{Bernoulli}
\left(x \mid p \right), 
\\; 
\textit{i.i.d}
\Rightarrow
X 
= 
\sum\_{i = 1}^{n} X\_i
\sim 
\text{Binomial}
\left( x \mid n, p \right)
\end{align}
$$

It’s probability mass function is

$$
f(k \mid n, p) 
=
P(X = k \mid n, p)
=
{n \choose k}
p^{k}(1-p)^{n-k},
\quad
k = \left\lbrace 0, \ldots, n \right\rbrace
.
$$

## The normal distribution

The (univariate) Normal distribution is a continuous distribution, with
support \[−∞,+∞\], with two parameters, the mean *μ* and the variance
*v*, with the probability density function
$$
f(x \mid \mu, v)
=
\frac{1}{\sqrt{2\pi v}}
\exp{\left(-\frac{1}{2v}(x - \mu)^2\right)}
.
$$
If *X* is a random variable following a Normal distribution,
i.e. *X* ∼ Normal(*x*∣*μ*,*v*) then
𝔼\[*X*\] = *μ*;  𝕍\[*X*\] = *v* = *σ*<sup>2</sup>
The *standard normal distribution* corresponds to a normal distribution
with mean *μ* = 0 and variance *v* = 1. The standard normal
distributions are typically denoted using *Z*.

### Facts about the Normal density

-   If *X* is a normal distributed random variable then the random
    variable *Z* obtained by substracting the mean and dividing by the
    standard deviation is following a standard normal distribution:
    $$
    X
    \sim
    \text{Normal}\left(z \mid \mu, v \right)
    \Rightarrow
    Z = \frac{X - \mu}{\sigma} 
    \sim
    \text{Normal}\left(z \mid 0, 1 \right)
    $$

-   Conversely, if *Z* is a standard normal distributed random variable
    then the random variable *X* obtained by multiplication with *σ* and
    adding *μ* is following a normal distribution with mean *μ* and
    *σ*<sup>2</sup>:
    *Z* ∼ Normal(*z*∣0,1) ⇒ *X* = *μ* + *σ**Z* ∼ Normal(*z*∣*μ*,*σ*<sup>2</sup>)

-   Approximately 68, 95 and 99 of the normal density lies within 1, 2
    and 3 standard deviations

-   -1.28, -1.645, -1.96 and -2.33 are the 10<sup>*t**h*</sup>,
    5<sup>*t**h*</sup>, 2.5<sup>*t**h*</sup> and 1<sup>*s**t*</sup>
    percentiles of the standard normal distribution respectively.

-   By symmetry, 1.28, 1.645, 1.96 and 2.33 are the 90<sup>*t**h*</sup>,
    95<sup>*t**h*</sup>, 97.5<sup>*t**h*</sup> and 99<sup>*s**t*</sup>
    percentiles of the standard normal distribution respectively.

### Example

Assume that the number of daily ad clicks for a company is
(approximately) normally distributed with a mean of 1020 and a standard
deviation of 50. What is the probability of getting more than 1060
clicks in a day?

One way to obtained this is via `pnorm`:

    pnorm(1160, mean = 1020, sd = 50, lower.tail = FALSE)

    ## [1] 0.00255513

Another way is compute the corresponding of 1060 for the standard normal
distribution:

    x = (1160 - 1020)/50
    pnorm(x, lower.tail = FALSE)

    ## [1] 0.00255513

Assume that the number of daily ad clicks for a company is
(approximately) normally distributed with a mean of 1020 and a standard
deviation of 50. What number of daily ad clicks would represent the one
where 75 of days have fewer clicks (assuming the days are )?

    qnorm(0.75, mean = 1020, sd = 50)

    ## [1] 1053.724

## The Poisson distributed

The Poisson distribution is a discrete distribution that used to model
counts. It defined on the non-negative integers, 0, 1, …, and its
probability mass function is expressed via one parameter (the rate
parameter) *λ*:
$$
P(X = x \mid \lambda)
=
\frac{\lambda^{x} \exp{\left(-\lambda\right)}}{x!}
$$

If *X* is a random variable following a Poisson distribution with rate
*λ*, i.e. *X* ∼ Poisson(*x*∣*λ*) then both the mean and the variance are
equal to the rate *λ*.
𝔼\[*X*\] = *λ*;  𝕍\[*X*\] = *v* = *λ*
\### Some uses for the Poisson distribution

-   Modeling count data (especially if the counts are unbounded).
-   Modeling event-time or survival data.
-   Modeling contingency tables.
-   Approximating binomials when *n* is large and *p* is small.

### Rates and Poisson random variables

-   Poisson random variables are used to model rates.
-   *X* ∼ Poisson(*λ**t*) where:
    -   *λ* = 𝔼\[*X*/*t*\] is the expected count per unit of time.
    -   *t* is the total monitoring time.

### Example

Suppose the number of people that show up at a bus stop is Poisson with
a mean of 2.5 per hour. If watching the bust stop for 4 hours, what is
the probability that 3 or fewer people show up for the whole time?

    ppois(3, lambda = 2.5 * 4)

    ## [1] 0.01033605

### Poisson approximation to the binomial

When *n* is large and *p* is small, the Poisson distribution is an
accurate approximation to the binomial distribution

Notation: \* *X* ∼ Binomial(*x*∣*n*,*p*) \* *λ* = *n**p* \* *n* gets
large \* *p* gets small

### Example

We flip a coin with success probability 0.01 five hundred times. What is
the probability of 2 or fewer successes?

    pbinom(2, 500, 0.01)

    ## [1] 0.1233858

    ppois(2, 500 * 0.01)

    ## [1] 0.124652

# Module 7: Asymptotics

**Asymptotics** is the term for the behavior of statistics as the sample
size (or some other relevant quantity of) limits to infinity or, in some
cases as something else limits to zero.

Asymptotics are very useful for simple statistical inference and
approximations.

Asymptotics form the basis for the frequentist interpretation of
probabilities: the long run (infinite run) proportion of times an event
occurs.

The intuition behind asymptotics is the proportion of heads in a flip of
a coin that should be precisely 0.5 when considered infinitely many
times. Behind this intuititon is the law of large numbers (LLN).

## The Law of Large Numbers

There are some results that allows us to talk about the large sample
distribution of sample means of a colection of observations.

The first restuls is the is the law of large numbers (LLN)

-   The LLN says that the average limits to what its estimating, the
    population mean.

### Example of LLN in action, standard normal distribution

    n <- 1000
    means <- cumsum(rnorm(n))/(1:n)
    plot(1:n, means, 
         type = 'l', lwd = 3,
         xlab = 'number of simulations', ylab = 'Average',
         col =  yarrr::transparent('maroon2', .6))
    abline(h = 0, lwd = 3,
           col = yarrr::transparent('cyan', .6),)
    title(main = 'Average of standard normal r.v.')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-15-1.png)

### Example of LLN in action, Bernoulli distribution (coin flip)

    n <- 1000
    means <- cumsum(rbinom(n,1,1/2))/(1:n)
    plot(1:n, means, 
         type = 'l', lwd = 3,
         xlab = 'number of simulations', ylab = 'Average',
         col =  yarrr::transparent('maroon2', .6))
    abline(h = 0.5, lwd = 3,
           col = yarrr::transparent('cyan', .6),)
    title(main = 'Average of standard normal r.v.')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-16-1.png)

### Discussion

An estimator is **consistent** if it converges to what you want to
estimate.

-   The LLN says that the **sample mean** of samples is a consistent
    estimator for the population mean.

-   The **sample variance** of random variables is consistent as well.

## The Central Limit Theorem

The central limit theorem (CLT) states that the distribution of averages
of variables, *properly normalized*, becomes that of a standard normal
as the sample size increases:

$$
\frac{\bar{X}\_n - \mu}{\sigma/\sqrt{n}}
=
\frac{\text{Estimate} - \text{Mean of Estimate}}{\text{Standard Error}}
\stackrel{n \to \infty}{\longrightarrow} 
\text{Normal}\left(x \mid 0, 1 \right)
.
$$
An equivalent way to express the CLT is

$$
\bar{X}\_n
\stackrel{n \to \infty}{\longrightarrow} 
\text{Normal}\left(x \mid \mu, \frac{\sigma^2}{n} \right)
.
$$

### Example: Simulate a standrd normal by die rolling

Simulate a standard normal random variable by rolling *n* (six sided)
dies

$$
X\_i - \text{the outcome for die } i
;
\begin{cases}
\mathbb{E}\left\[ X\_i \right\] = 3.5
\\\\
\mathbb{V}\left\[ X\_i \right\] = 2.92
\end{cases}
$$
Via the CLT,

$$
\frac{\bar{X\_n} - 3.5}{\sqrt{2.92/n}} \stackrel{n\to \infty}{\longrightarrow} \text{Normal}\left(x \mid 0, 1\right)
$$

    n <- 10000
    xMeans10 <- tapply(x <- sample(1:6, n, replace = TRUE), 
                      rep(1:n/10, each = 10, length.out = n), 
                      mean)
    xMeans10 <- (xMeans10-3.5)/sqrt(2.92/10)

    n <- 20000
    xMeans20 <- tapply(x <- sample(1:6, n, replace = TRUE), 
                      rep(1:n/20, each = 20, length.out = n), 
                      mean)
    xMeans20 <- (xMeans20-3.5)/sqrt(2.92/20)

    n <- 30000
    xMeans30 <- tapply(x <- sample(1:6, n, replace = TRUE), 
                      rep(1:n/30, each = 30, length.out = n), 
                      mean)
    xMeans30 <- (xMeans30-3.5)/sqrt(2.92/30)

    par(mfrow = c(1,3))
    hist(xMeans10, breaks = seq(-4.35, 4.35, 0.3),
         col = yarrr::transparent('maroon2', .6), freq = FALSE)
    lines(seq(-4.35, 4.35, 0.3), dnorm(seq(-4.35, 4.35, 0.3)), 
          lwd = 3, col = 'magenta3')

    hist(xMeans20, breaks = seq(-4.35, 4.35, 0.3),
         col = yarrr::transparent('cyan', .6), freq = FALSE)
    lines(seq(-4.35, 4.35, 0.3), dnorm(seq(-4.35, 4.35, 0.3)), 
          lwd = 3, col = 'magenta3')

    hist(xMeans30, breaks = seq(-4.35, 4.35, 0.3),
         col = yarrr::transparent('olivedrab3', .6), freq = FALSE)
    lines(seq(-4.35, 4.35, 0.3), dnorm(seq(-4.35, 4.35, 0.3)), 
          lwd = 3, col = 'magenta3')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-17-1.png)

### Example coin flipping

Let *X*<sub>*i*</sub> be the 0 or 1 result of the *i*<sup>*t**h*</sup>
flip of a possible unfair coin

-   The sample proportion, say *p̂* is the average of the coin flips.
-   𝔼\[*X*<sub>*i*</sub>\] = *p*
-   𝕍\[*X*<sub>*i*</sub>\] = *p*(1−*p*)
-   $\text{SEM} = \frac{\sigma}{\sqrt{n}} = \sqrt{\frac{p(p-1)}{n}}$
    According to CLT,

$$
\frac{\widehat{p} - p}{\sqrt{p(p-1)/n}}
\stackrel{n\to \infty}{\longrightarrow} \text{Normal}\left(x \mid 0, 1\right)
$$

For *p* = 1/2, the variance is *v* = 1/4 and the standard deviation is
*σ* = 1/2

    n <- 10000
    xMeans10 <- tapply(x <- sample(0:1, n, replace = TRUE), 
                      rep(1:n/10, each = 10, length.out = n), 
                      mean)
    xMeans10 <- (xMeans10 - .5)/sqrt(1/(4*10))

    n <- 20000
    xMeans20 <- tapply(x <- sample(0:1, n, replace = TRUE), 
                      rep(1:n/20, each = 20, length.out = n), 
                      mean)
    xMeans20 <- (xMeans20 - .5)/sqrt(1/(4*20))

    n <- 30000
    xMeans30 <- tapply(x <- sample(0:1, n, replace = TRUE), 
                      rep(1:n/30, each = 30, length.out = n), 
                      mean)
    xMeans30 <- (xMeans30 - 0.5)/sqrt(1/(4*30))

    par(mfrow = c(1,3))
    hist(xMeans10, breaks = seq(-5, 5, 0.25),
         col = yarrr::transparent('maroon2', .6), freq = FALSE)
    lines(seq(-5, 5, 0.25), dnorm(seq(-5, 5, 0.25)), 
          lwd = 3, col = 'magenta3')

    hist(xMeans20, breaks = seq(-5, 5, 0.25),
         col = yarrr::transparent('cyan', .6), freq = FALSE)
    lines(seq(-5, 5, 0.25), dnorm(seq(-5, 5, 0.25)), 
          lwd = 3, col = 'magenta3')

    hist(xMeans30, breaks = seq(-5, 5, 0.25),
         col = yarrr::transparent('olivedrab3', .6), freq = FALSE)
    lines(seq(-5, 5, 0.25), dnorm(seq(-5, 5, 0.25)), 
          lwd = 3, col = 'magenta3')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-18-1.png)

For the coin flipping, the speed of convergences of the average towards
the normal distribution heavely depends on how biased the coin is. The
next figure shows the same results as before but for a coin with
probability of success 0.9:

    n <- 10000
    xMeans10 <- tapply(x <- sample(0:1, n, replace = TRUE, prob = c(0.1, 0.9)), 
                      rep(1:n/10, each = 10, length.out = n), 
                      mean)
    xMeans10 <- (xMeans10 - .9)/sqrt(0.09/10)

    n <- 20000
    xMeans20 <- tapply(x <- sample(0:1, n, replace = TRUE, prob = c(0.1, 0.9)), 
                      rep(1:n/20, each = 20, length.out = n), 
                      mean)
    xMeans20 <- (xMeans20 - .9)/sqrt(0.09/20)

    n <- 30000
    xMeans30 <- tapply(x <- sample(0:1, n, replace = TRUE, prob = c(0.1, 0.9)), 
                      rep(1:n/30, each = 30, length.out = n), 
                      mean)
    xMeans30 <- (xMeans30 - .9)/sqrt(0.09/30)

    par(mfrow = c(1,3))
    hist(xMeans10, breaks = seq(-7, 7, 0.25),
         col = yarrr::transparent('maroon2', .6), freq = FALSE)
    lines(seq(-7, 7, 0.25), dnorm(seq(-7, 7, 0.25)), 
          lwd = 3, col = 'magenta3')

    hist(xMeans20, breaks = seq(-7, 7, 0.25),
         col = yarrr::transparent('cyan', .6), freq = FALSE)
    lines(seq(-7, 7, 0.25), dnorm(seq(-7, 7, 0.25)), 
          lwd = 3, col = 'magenta3')

    hist(xMeans30, breaks = seq(-7, 7, 0.25),
         col = yarrr::transparent('olivedrab3', .6), freq = FALSE)
    lines(seq(-7, 7, 0.25), dnorm(seq(-7, 7, 0.25)), 
          lwd = 3, col = 'magenta3')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-19-1.png)

## Confidence intervals

*X̄* is approximately normal with mean *μ* and standard deviation
$\sigma/\sqrt{n}$.

The probability that *X̄* is bigger than $\mu + 2 \sigma /\sqrt{n}$ or
smaller than $\mu - 2 \sigma /\sqrt{n}$ is 5.

$$
P\left(\mu - 2 \frac{\sigma}{\sqrt{n}} \leq \bar{X} \leq \mu + 2 \frac{\sigma}{\sqrt{n}} \right)
\approx
0.95.
$$
Similar results can be considered for one stanadard deviation or three
stantadard deviations (68-–95-–99.7 rule).

Another way of expression the probability above is

$$
P\left(\bar{X} - 2 \frac{\sigma}{\sqrt{n}} \leq \mu \leq \bar{X} + 2 \frac{\sigma}{\sqrt{n}} \right)
\approx
0.95
,
$$
which says that the probability of the interval
$\left\[ \bar{X} - 2 \sigma/\sqrt{n}, \bar{X} + 2 \sigma/\sqrt{n} \right\]$
contain the population mean *μ* is 0.95. (Note that the interval is
random, in the sense that is defined via the random variable *X̄* and the
population mean is fixed.)

The interval
$\left\[ \bar{X} - 2 \sigma / \sqrt{n}, \bar{X} + 2 \sigma / \sqrt{n} \right\]$
represents a confidence interval.

The interpretation of the last probability is the following: for
different confidence intervals constructed from different samples of
size n from the population, 95 of the intervals will contain *μ*.

-   The 97.5th quantile is about 1.96. The exact equality is obtained by
    using the 97.5th quantile instead of 2.

-   The 90 interval is obtained by using the 95th quantile, which is
    about 1.645, instead of 2.

### Example Father Son Data

    data(father.son)
    x <- father.son$sheight
    confIntInch <- mean(x) + c(-1,1) * qnorm(0.975) * sd(x)/ length(x)
    confIntInch

    ## [1] 68.67895 68.68919

    confIntFeet <- confIntInch / 12
    confIntFeet

    ## [1] 5.723246 5.724099

### Example: Binomial proportion confidence interval

The **binomial proportion confidence interval** is a confidence interval
corresponding to the probability of success calculated from the outcome
of Bernoulli trials. It is an interval estimate of a success probability
*p* when only the number of experiments *n* and the number of successes
*n*<sub>*S*</sub> are known.

-   Let *X*<sub>*i*</sub> be *i.i.d* Bernoulli r.v. with success
    probabilities *p*.

-   The population mean is *μ* = *p* and the population variance is
    *σ*<sup>2</sup> = *p*(1−*p*).

-   The sample mean is *p̂* and the population variance is *p̂*(1−*p̂*).

-   Using the CLT and approximating the distribution of *p̂* with a
    normal distribution leads to the **normal approximation interval**
    or **Wald interval**, which us using the sample mean and the sample
    variance:

$$
\text{CI} = \widehat{p} \pm z\_{1 - \alpha/2} \sqrt{\frac{\widehat{p}(1-\widehat{p})}{n}}
$$

-   This approximation is unreliable when
    -   the sample size is small
    -   the success probability is close to 0 or 1.\[4\]
-   A 95% CI conservative estimate is based on
    -   the fact that *p*(1−*p*) ≤ 1/4, *p* ∈ \[0,1\] (see the graph
        bellow) hence
        $\sqrt{\widehat{p}(1-\widehat{p})/n} \leq 1/(2\sqrt{n})$
    -   the fact that *z*<sub>0.025</sub> and *z*<sub>0.975</sub>,
        corresponding to *z*<sub>1 − *α*/2</sub>, with *α* = 5, is
         ± 1.959 ≤  ± 2 hence

$$
\text{CI} 
=
\widehat{p}
\pm
\frac{1}{\sqrt{n}}
$$

    p <- seq(0, 1, by = 0.01)
    par(bty="l")
    plot(p, p*(1-p), 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('maroon2', .6))

![](Notes2_files/figure-markdown_strict/unnamed-chunk-21-1.png)

### Example: Binomial proportion confidence interval

Your campaign advisor told you that in a random sample of 100 likely
voters, 56 intent to vote for you. \* Can you relax? Do you have the
race in the bag? \* With no access to a computer, how precise is this
estimate?

A conservative estimate based on Wald interval is given by
$$
\widehat{p} \pm \frac{1}{\sqrt{n}}
$$
where *p̂* = 0.56 and *n* = 100, a conservative estimate for the CI is:
$$
0.56 \pm \frac{1}{\sqrt{100}}
=
\left\[0.46, 0.66 \right\]
$$
which shows that the race can still be lost.

    mu = 0.56
    n = 100
    mu + c(-1,1) * 1/sqrt(n) 

    ## [1] 0.46 0.66

The 95 CI interval obtained without the approximations corresponding to
the 0.975 quantile and the approximation corresponding to the sample
variance, i.e the 95 CI interval obtained based solely on the

    0.56 + c(-1,1) * qnorm(0.975) * sqrt((0.56 * 0.44)/100)

    ## [1] 0.4627099 0.6572901

The binomial test is an exact test (i.e. assuring 95% coverage or
higher, irrespective of the size N); it does not rely on the CLT.

    binom.test(56,100)$conf.int

    ## [1] 0.4571875 0.6591640
    ## attr(,"conf.level")
    ## [1] 0.95

### Example

The coin flipping experiment is considered, with success probability
*p*. The percentage of times the 95% CI computed via CLT covers the true
success probability is computed.

    countCorrectCI = function(p){
    phats <- rbinom(nsim, size = n, prob = p)/n

    ul <- phats + qnorm(0.975) * sqrt(phats *(1-phats)/n)
    ll <- phats - qnorm(0.975) * sqrt(phats *(1-phats)/n)

    return(mean(ll < p & ul > p))
    }

    nsim <- 1000
    n <- 20
    pValues <- seq(0.1, 0.9, by = 0.05)

    coverage <- sapply(pValues, countCorrectCI)

    par(bty="l")
    plot(pValues, coverage, 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('maroon2', .6))
    abline(h = 0.95, lwd = 3, 
         col = yarrr::transparent('olivedrab4', .6))

![](Notes2_files/figure-markdown_strict/unnamed-chunk-25-1.png)

As mentioned, this approximation via the CLT is unreliable when the
sample size is small or whrn the success probability is close to 0 or 1.
This behavior can be clearly seen in the plot, with unreliable CI
estimates for values of *p* close to zero or one.

When the sample size is increased, the CLT becomse more reliable. The
next cell is considering the same simulation but the sample size is
increased to 100.

    countCorrectCI = function(p){
    phats <- rbinom(nsim, size = n, prob = p)/n

    ul <- phats + qnorm(0.975) * sqrt(phats *(1-phats)/n)
    ll <- phats - qnorm(0.975) * sqrt(phats *(1-phats)/n)

    return(mean(ll < p & ul > p))
    }

    nsim <- 1000
    pValues <- seq(0.1, 0.9, by = 0.05)

    n <- 20
    coverage20 <- sapply(pValues, countCorrectCI)

    n <- 100
    coverage100 <- sapply(pValues, countCorrectCI)

    par(bty="l")
    plot(pValues, coverage20, 
         type = 'l', lwd = 3, 
         ylim = range(c(coverage20,coverage100)),
         col = yarrr::transparent('maroon2', .6))
    lines(pValues, coverage100, 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('cyan3', .6))
    abline(h = 0.95, lwd = 3, 
         col = yarrr::transparent('olivedrab4', .6))
    legend('bottomleft', 
           legend = c('n = 20', 'n = 100'),
           col = c(yarrr::transparent('maroon2', .6),
                   yarrr::transparent('cyan3', .6)),
           bty = "n", lty = 1, lwd = '3')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-26-1.png)

#### Agresti-Coull interval

If *n* is not large enough for CLT to be reliable, the Agresti-Coull
procedure implies adding two successes and two failures to form the
interval, i.e.

$$
\frac{\widehat{p} + 2}{n + 2}
$$
This new sample proportion is slightly shrunk towards 0.5.

The next cell is considering the same simulation with 20 samples but
it’s using the Agresti-Coull procedure to shrink the proportion towards
0.5

    countCorrectCI = function(p){
    phats <- rbinom(nsim, size = n, prob = p)/n

    ul <- phats + qnorm(0.975) * sqrt(phats *(1-phats)/n)
    ll <- phats - qnorm(0.975) * sqrt(phats *(1-phats)/n)

    return(mean(ll < p & ul > p))
    }

    countCorrectCIAC = function(p){
    phats <- (rbinom(nsim, size = n, prob = p) + 2)/(n + 2)

    ul <- phats + qnorm(0.975) * sqrt(phats *(1-phats)/n)
    ll <- phats - qnorm(0.975) * sqrt(phats *(1-phats)/n)

    return(mean(ll < p & ul > p))
    }

    nsim <- 1000
    pValues <- seq(0.1, 0.9, by = 0.05)

    n <- 20
    coverage20 <- sapply(pValues, countCorrectCI)

    n <- 100
    coverage100 <- sapply(pValues, countCorrectCI)

    n <- 100
    coverage20AC <- sapply(pValues, countCorrectCIAC)

    par(bty="l")
    plot(pValues, coverage20, 
         type = 'l', lwd = 3, 
         ylim = range(c(coverage20,coverage100)),
         col = yarrr::transparent('maroon2', .6))
    lines(pValues, coverage100, 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('cyan3', .6))
    lines(pValues, coverage20AC, 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('orchid4', .6))
    abline(h = 0.95, lwd = 3, 
         col = yarrr::transparent('olivedrab4', .6))
    legend('bottomleft', 
           legend = c('n = 20', 'n = 100', 'n = 20 AC'),
           col = c(yarrr::transparent('maroon2', .6),
                   yarrr::transparent('cyan3', .6),
                   yarrr::transparent('orchid4', .6)),
           bty = "n", lty = 1, lwd = '3')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-27-1.png)

### Poisson interval

A nuclear pump failed 5 times out of 94.32 days. Give a 95% CI for the
failure rate per day.

-   *X* ∼ Poisson(*λ**t*)
-   For a Poisson distributon with rate parameter *λ* the mean and the
    variance are both *λ*
-   The mean estimate is *λ̂* = *X*/*t*
-   The variance estimate is *λ̂*/*t*

<!-- -->

    x <- 5
    t <- 94.32
    lambda <- x/t
    round(lambda + c(-1,1)*qnorm(0.975)*sqrt(lambda/t), 3)

    ## [1] 0.007 0.099

An exact Poisson test:

    poisson.test(x,T = t)$conf

    ## [1] 0.01721254 0.12371005
    ## attr(,"conf.level")
    ## [1] 0.95

#### Poisson coverage rate

    countCorrectCI = function(lambda){
    lhats <- rpois(nsim, lambda = lambda * t)/t

    ul <- lhats + qnorm(0.975) * sqrt(lhats /t)
    ll <- lhats - qnorm(0.975) * sqrt(lhats / t)

    return(mean(ll < lambda & ul > lambda))
    }

    nsim <- 1000
    t <- 100
    lValues <- seq(0.005, 0.1, by = 0.01)

    coverage <- sapply(lValues, countCorrectCI)

    par(bty="l")
    plot(lValues, coverage, 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('maroon2', .6))
    abline(h = 0.95, lwd = 3, 
         col = yarrr::transparent('olivedrab4', .6))

![](Notes2_files/figure-markdown_strict/unnamed-chunk-30-1.png)

As it was the case with the binomial case, where we have seen that the
CLT does not produce reliable CI for success probability values close to
zero or one, for the Poisson distributon the CLT does not produce
reliable CI for small values of lambda (corresponding to small number of
events for large amount of monitoring time). As always, one remedy is to
increase the sample size. The next cell corresponds to the same code but
the value *t* is now set to 1000.

    countCorrectCI = function(lambda){
    lhats <- rpois(nsim, lambda = lambda * t)/t

    ul <- lhats + qnorm(0.975) * sqrt(lhats /t)
    ll <- lhats - qnorm(0.975) * sqrt(lhats / t)

    return(mean(ll < lambda & ul > lambda))
    }

    nsim <- 1000
    lValues <- seq(0.005, 0.1, by = 0.01)
    t <- 100
    coverage100 <- sapply(lValues, countCorrectCI)
    t <- 1000
    coverage1000 <- sapply(lValues, countCorrectCI)


    par(bty="l")
    plot(lValues, coverage100, 
         type = 'l', lwd = 3, 
         ylim = range(c(coverage100, coverage1000)),
         col = yarrr::transparent('maroon2', .6))
    lines(lValues, coverage1000, 
         type = 'l', lwd = 3, 
         col = yarrr::transparent('cyan2', .6))
    abline(h = 0.95, lwd = 3, 
         col = yarrr::transparent('olivedrab4', .6))
    legend('bottomleft', 
           legend = c('t = 100', 't = 1000'),
           col = c(yarrr::transparent('maroon2', .6),
                   yarrr::transparent('cyan3', .6)),
           bty = "n", lty = 1, lwd = '3')

![](Notes2_files/figure-markdown_strict/unnamed-chunk-31-1.png)

## Summary

-   The LLN is stating that averages of sample converge to the
    population means that they are estimating.
-   The CLT states that averages are approximately normal, with
    distributons :
    -   centereed at the population mean (which we knew already)
    -   with stadard deviations equal to the standard error of the mean
        (which we already knew also)
    -   CLT gives no guarantees that *n* is large enough
-   Taking the mean and adding and substracting the relevant normal
    quantile times the SE yuelds a CI for the mean (this is the default
    way of creating CI).
-   Confidence intervals gets wider as the coverage increases (this is
    natural, in order to guarantee a high coverage, the interval get
    wider)  
-   For the binomial and Poisson distributons, have exact intervals that
    don’t require CLT.
