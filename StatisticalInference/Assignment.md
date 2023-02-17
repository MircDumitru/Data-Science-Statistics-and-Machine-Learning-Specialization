



-   <a href="#part-1-simulation-exercise-instructions"
    id="toc-part-1-simulation-exercise-instructions">Part 1: Simulation
    Exercise Instructions</a>
    -   <a
        href="#show-the-sample-mean-and-compare-it-to-the-theoretical-mean-of-the-distribution"
        id="toc-show-the-sample-mean-and-compare-it-to-the-theoretical-mean-of-the-distribution">1.
        Show the sample mean and compare it to the theoretical mean of the
        distribution</a>
    -   <a
        href="#show-how-variable-the-sample-is-via-variance-and-compare-it-to-the-theoretical-variance-of-the-distribution."
        id="toc-show-how-variable-the-sample-is-via-variance-and-compare-it-to-the-theoretical-variance-of-the-distribution.">2.
        Show how variable the sample is (via variance) and compare it to the
        theoretical variance of the distribution.</a>
    -   <a href="#show-that-the-distribution-is-approximately-normal."
        id="toc-show-that-the-distribution-is-approximately-normal.">3. Show
        that the distribution is approximately normal.</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Part 1: Simulation Exercise Instructions

### 1. Show the sample mean and compare it to the theoretical mean of the distribution

Consider *n* random variables *X*<sub>1</sub>, …, *X*<sub>*n*</sub>,
following an Exponential distribution with rate parameter *λ*:
*X*<sub>1</sub> ∼ exponential(*x*∣*λ*)
The corresponding mean *μ* and variance *σ*<sup>2</sup> are
$$
\mathbb{E}\left\[ X\_1 \right\] = \mu = \frac{1}{\lambda}
;
\quad
\mathbb{V}\left\[ X\_1 \right\] = \sigma^2 = \frac{1}{\lambda^2}
$$
Via the Central Limit Theorem, the average sample of the *n*
exponentially distributed random variables,
$$
\bar{X} = \frac{1}{n}\sum\_{i}^{n} X\_i
$$

follow a normal distribution with mean *μ* and variance
*σ*<sup>2</sup>/*n*:

$$
\bar{X} \sim \text{Normal}(x \mid \mu, \frac{\sigma^2}{n})
$$
For the case where the rate parameter corresponding to the Exponential
distribution is set to *λ* = 0.2 and the number of samples considered is
set to *n* = 40, the theoretical mean and the theoretical standard
distribution corresponding to the Normal distribution gouverning the
average random variabve *X̄* are
$$
\mu = \frac{1}{\lambda} = \frac{1}{0.2} = 5;
\quad
\text{sd} = \frac{\sigma}{\sqrt{n}} = \frac{5}{\sqrt{40}} \approx 0.79.
$$

40 (`nSamples`) exponential samples are simulated and the corresponding
average mean 1000 times (`nSimulations`) are computed. The histogram
corresponding to the 1000 simulated averages is presented together with
the theoretical Normal distribution Normal(*x*∣*μ*=5,sd=0.79) and the
theoretical mean (*μ* = 5, black solid line) is compared with the sample
mean computed from the available 1000 average samples (*x̄*, black dotted
line).

![](Assignment_files/figure-markdown_strict/unnamed-chunk-1-1.png)

### 2. Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.

This time the histogram corresponding to the 1000 simulated averages is
presented together with the theoretical Normal distribution
Normal(*x*∣*μ*=5,sd=0.79) and the theoretical mean plus/minus the
theoretical variance ($\mu \pm \sigma/\sqrt{n}$, black solid line) is
compared with the sample mean plus/minus the sample standard deviation,
both computed from the available 1000 average samples (*x̄* ± *s*, black
dotted line).

![](Assignment_files/figure-markdown_strict/unnamed-chunk-2-1.png)

### 3. Show that the distribution is approximately normal.

The histogram and it’s corresponding estimated density is compared with
the density corresponding to the (theoretical) Normal distribution,
Normal(*x*∣*μ*,*σ*<sup>2</sup>/*n*) when the sample size (correponding
to the number of Exponential used to compute the average mean) is 40 and
the number of simulations is 100, 1000 and 10000. As the number of
simulations increases, the estimated density is approaching the density
of the limiting Normal distribution.

![](Assignment_files/figure-markdown_strict/unnamed-chunk-3-1.png)

The same comparison is considered the sample size set to 100. Note that
in this case, compared the previous case, for equal number of
simulations, the estimation is better, due to the increase number of
samples for computing the average.

![](Assignment_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    library(ggplot2)
    expMeanSamples1<-as.data.frame(expMeanSamples1)
    ggplot(expMeanSamples1, aes(sample=expMeanSamples1))+stat_qq()

![](Assignment_files/figure-markdown_strict/unnamed-chunk-5-1.png)
