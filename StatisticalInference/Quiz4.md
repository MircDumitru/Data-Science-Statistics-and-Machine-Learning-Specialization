<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Question 1

A pharmaceutical company is interested in testing a potential blood
pressure lowering medication. Their first examination considers only
subjects that received the medication at baseline then two weeks later.
The data are as follows (SBP in mmHg):

<table>
<thead>
<tr class="header">
<th style="text-align: center;">Subject</th>
<th style="text-align: center;">Baseline</th>
<th style="text-align: center;">Week 2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">1</td>
<td style="text-align: center;">140</td>
<td style="text-align: center;">132</td>
</tr>
<tr class="even">
<td style="text-align: center;">2</td>
<td style="text-align: center;">138</td>
<td style="text-align: center;">135</td>
</tr>
<tr class="odd">
<td style="text-align: center;">3</td>
<td style="text-align: center;">150</td>
<td style="text-align: center;">151</td>
</tr>
<tr class="even">
<td style="text-align: center;">4</td>
<td style="text-align: center;">148</td>
<td style="text-align: center;">146</td>
</tr>
<tr class="odd">
<td style="text-align: center;">5</td>
<td style="text-align: center;">135</td>
<td style="text-align: center;">130</td>
</tr>
</tbody>
</table>

Consider testing the hypothesis that there was a mean reduction in blood
pressure? Give the P-value for the associated two sided T test.

## Answer 1

The experiment is following to establish the potential benefits of the
medication (i.e. the lowering of SBP) by measuring the baseline SBP and
the SBP two weeks after the medication administration. The experiment
design involves measurements for the same patients, hence the data are
paired.

The test that will be used should be a paired *t* test, testing for the
null hypothesis that the difference between the two groups is zero,
i.e. *H*<sub>0</sub> : *μ*<sub>*b*</sub> − *μ*<sub>*m*</sub> = 0. The
alternative hypothesis is
*H*<sub>0</sub> : *μ*<sub>*b*</sub> − *μ*<sub>*m*</sub> ≠ 0.

The *t* test is perfomed in `R` via `t.test`.

For the alternative hypothesis, `alternative = two.sided` should be
seted.

For paired data, `paired = TRUE` should be seted.

Since no information is provided about the two groups variances, the
test should be performed under the assumption that the two variances are
not necessarily equal, i.e. `var.equal = FALSE` (this is the default
value so it doesn’t have to be explicitly stated).

    x <- c(140, 138, 150, 148, 135)

    y <- c(132, 135, 151, 146, 130)

    t.test(y, x, paired = TRUE, alternative = "two.sided", var.equal = TRUE)$p.value

    ## [1] 0.08652278

Equivalently

    t.test(y-x, alternative = "two.sided", var.equal = TRUE)$p.value

    ## [1] 0.08652278

## Question 2

A sample of 9 men yielded a sample average brain volume of 1,100cc and a
standard deviation of 30cc. What is the complete set of values of
*μ*<sub>0</sub> that a test *H*<sub>0</sub> : *μ* = *μ*<sub>0</sub>
would fail to reject the null hypothesis in a two sided 5% Students
t-test?

## Answer 2

The normalized sample average random variable is following a *t*
distribution with *n* − 1 degrees of freedom, i.e.

$$
\frac{\bar{X} - \bar{x}}{\text{SE}} \sim t(n-1),
$$
where *n* represents the number of samples, *S**E* the standard error,
$\text{SE} = \sigma/\sqrt{n}$, defined via the samples standard
deviation and *x̄* the sample mean.

The 95% confidence interval corresponding to a significance level
*α* = 0.05 is given by

$$
\mu \pm \text{SE} \times t\_{1-\frac{\alpha}{2},n-1},
$$

where $t\_{1-\frac{\alpha}{2}$ represents the quantile function.

In this case, *n* = 9, *x̄* = 1100 and *σ* = 30.

    n = 9
    mu = 1100
    sd = 30
    SE = sd/sqrt(n)

    mu + c(-1, 1) * SE * qt(0.975, n-1)

    ## [1] 1076.94 1123.06

## Question 3

Researchers conducted a blind taste test of Coke versus Pepsi. Each of
four people was asked which of two blinded drinks given in random order
that they preferred. The data was such that 3 of the 4 people chose
Coke. Assuming that this sample is representative, report a P-value for
a test of the hypothesis that Coke is preferred to Pepsi using a one
sided exact test.

## Answer 3

The hypothesis can be tested using the Binomial distribution, testing
for the success probability *p* being greater than 0.5.

This boils down to a null hypothesis where we test for the success
probability being exactly 0.5 since for every success probability
greater than 0.5 the corresponding *p*- value will be greater.

The null hypothesis is *H*<sub>0</sub> : *p* = 0.5. The alternative
hypothesis is *H*<sub>*a*</sub> : *p* ≥ 0.5

The *p*-value of observing 3 successes out of 4 trials, or a more
extreme value (i.e. 4 successes out of 4) under the null hypothesis is:

$$
P\left( X &gt; 3 \right) = {4 \choose 3} p^3(1-p) + {4 \choose 4} p^4 = 5 \times \frac{1}{2^4} = 0.3125.
$$
This can be computed via `pbinom`, with `q` = 3 − 1 = 2, `size` $ = 4$
and `prob`  = 0.5:

    1 - pbinom(2, 4, 0.5)

    ## [1] 0.3125

or by simply selecting the upper tail:

    pbinom(2, 4, 0.5, lower.tail = FALSE)

    ## [1] 0.3125

The exact binomial test is computed via `binom.test` with the
`alternative = "greater"`

    binom.test(3, 4, p = 0.5, alternative = "less", conf.level = 0.95)

    ## 
    ##  Exact binomial test
    ## 
    ## data:  3 and 4
    ## number of successes = 3, number of trials = 4, p-value = 0.9375
    ## alternative hypothesis: true probability of success is less than 0.5
    ## 95 percent confidence interval:
    ##  0.0000000 0.9872585
    ## sample estimates:
    ## probability of success 
    ##                   0.75

## Question 4

Infection rates at a hospital above 1 infection per 100 person days at
risk are believed to be too high and are used as a benchmark. A hospital
that had previously been above the benchmark recently had 10 infections
over the last 1,787 person days at risk. About what is the one sided
P-value for the relevant test of whether the hospital is *below* the
standard? Given the model, could the observed rate being larger than
0.05 be attributed to chance?

## Answer 4

Under the assumption that the count i.e. the number of infection is
Poisson distributed,

*X* ∼ Poisson(*x*∣*t**λ*)

We test for the null hypothesis corresponding to a *λ* equal to the
benchmark,
*H*<sub>0</sub> : *λ* = 0.01
with the alternative hypothesis corresponding to a rate parameter bellow
the standard

*H*<sub>0</sub> : *λ* &lt; 0.01

The *p*-value corresponds to the probability of observing 10 infections
under the null hypothesis, i.e. *λ* = 0.01 over the last 1,787 person
days at risk, i.e.

*p*-value = Poisson(*X*≤10∣1787*λ*)

    observedRate <- 10/1787
    benchmarkRate <- 1/100
    lambda = benchmarkRate
    ppois(10, 1787*lambda, lower.tail = TRUE)

    ## [1] 0.03237153

## Question 5

Suppose that 18 obese subjects were randomized, 9 each, to a new diet
pill and a placebo. Subjects’ body mass indices (BMIs) were measured at
a baseline and again after having received the treatment or placebo for
four weeks. The average difference from follow-up to the baseline
(followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for
the placebo group. The corresponding standard deviations of the
differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the
placebo group. Does the change in BMI appear to differ between the
treated and placebo groups? Assuming normality of the underlying data
and a common population variance, give a *p*-value for a two sided *t*
test.

## Answer 5

    mu_t <- -3; sd_t <- 1.5; n_t <- 9
    mu_p <- 1;  sd_p <- 1.8; n_p <- 9

    mu <- mu_t - mu_p

    df <- n_p + n_t - 2

    pooledSd <- sqrt(((n_t-1)*sd_t**2 + (n_p-1)*sd_p**2)/(n_t + n_p - 2))

    sd <- pooledSd * sqrt(1/n_t + 1/n_p)

    x <- mu /sd
    2*pt(x, df) 

    ## [1] 0.0001025174

    2*pnorm(x)

    ## [1] 3.031546e-07

## Question 6

Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to
1,123 cc. Would you reject in a two sided 5% hypothesis test of
*H*<sub>0</sub> : *μ* = 1078?

## Answer 6

The test wouldn’t be rejected for the 90% confidence interval, since the
value *μ* = 1078 belongs to the confidence interval. The 95% confidence
interval is wider than the 90% confidence interval, hence including
*μ* = 1078. The hypothesis would not be rejected.

## Question 7

Researchers would like to conduct a study of 100 healthy adults to
detect a four year mean brain volume loss of .01 mm<sup>3</sup>. Assume
that the standard deviation of four year volume loss in this population
is .04 mm<sup>3</sup>. About what would be the power of the study for a
5% one sided test versus a null hypothesis of no volume loss?

## Answer 7

The null hypothesis is
*H*<sub>0</sub> : *μ* = 0.
and the alternative hypothesis is
*H*<sub>0</sub> : *μ* &gt; 0.
with the sample mean *x̄* = 0.1, the population variance *σ* = 0.04 and
*n* = 100 the number of samples.

A 5% one sided test versus a null hypothesis of no volume loss means the
significance level is *α* = 0.1.

*α* = P(reject *H*<sub>0</sub>∣*H*<sub>0</sub>)
The test statistic is the normalized average random variable,
i.e. $({X} - )/$ which follows a standard normal distribution
$$
\frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \sim \text{Normal} \left( x \mid 0, 1\right)
.
$$
The significance level of *α* = 0.1 means that, **under the null
hypothesis** *μ* = 0, “reject *H*<sub>0</sub>” is done for observed
sample mean values greater than 1 − *α*/2 quantile, i.e. 
$$
\frac{\bar{X}}{\sigma/\sqrt{n}} &gt; z\_{1-\frac{\alpha}{2}}
$$
The power is then:
$$
\begin{align}
\text{Power} 
= 
\text{P} \left( \text{reject } H\_{0} \mid H\_{1} \right)
=
\text{P} \left( \frac{\bar{X}}{\sigma/\sqrt{n}} &gt; z\_{1-\frac{\alpha}{2}} \mid \mu = 0.01 \right)
=
\text{P} \left( \frac{\bar{X}-0.01}{\sigma/\sqrt{n}} &gt; z\_{1-\frac{\alpha}{2}} - \frac{0.01}{\sigma/\sqrt{n}} \right)
=
\text{P} \left( Z &gt; z\_{1-\frac{\alpha}{2}} - \frac{0.01}{\sigma/\sqrt{n}} \right)
\end{align}
$$

    alpha = 0.1
    mu = 0.01
    sigma = 0.04
    n = 100
    pnorm(qnorm(1-alpha/2)-mu/(sigma/sqrt(n)), lower.tail = FALSE)

    ## [1] 0.8037649

A direct way, using the `power.t.test`, specifing the number of samples,
the difference of means and the population standard deviation is:

    power.t.test(n = 100, delta = 0.01, sd = 0.04, 
                 sig.level = 0.05,
                 type = 'one.sample', 
                 alt = 'one.sided')$power

    ## [1] 0.7989855

## Question 8

Researchers would like to conduct a study of *n* healthy adults to
detect a four year mean brain volume loss of .01 mm<sup>3</sup>. Assume
that the standard deviation of four year volume loss in this population
is .04 mm<sup>3</sup>. About what would be the value of *n* needed for
90% power of type one error rate of 5% one sided test versus a null
hypothesis of no volume loss?

## Answer 8

Via the computations from the before,
$$
\begin{align}
0.8
=
\text{Power} 
=
\text{P} \left( Z &gt; z\_{1-\frac{\alpha}{2}} - \frac{0.01}{\sigma/\sqrt{n}} \right)
=
\text{P} \left( Z &gt; z\_{1-\frac{\alpha}{2}} -  \frac{\sqrt{n}}{4} \right)
,
\end{align}
$$
hence

$$
\begin{align}
z\_{1-\frac{\alpha}{2}} - \frac{\sqrt{n}}{4}
=
z\_{\frac{1-0.8}{2}}
\Rightarrow
\sqrt{n}
=
4
\left(
z\_{0.95}-z\_{0.1}
\right)
\end{align}
$$

    n = (4 * (qnorm(0.95)-qnorm(0.1)))**2
    n

    ## [1] 137.0216

Directly, via the `power.t.test`:

    power.t.test(power = 0.9, delta = 0.01, sd = 0.04, 
                 sig.level = 0.05,
                 type = 'one.sample', 
                 alt = 'one.sided')$n

    ## [1] 138.3856

## Question 9

As you increase the type one error rate, *α*, what happens to power?

## Answer 9

Power is decreasing.
