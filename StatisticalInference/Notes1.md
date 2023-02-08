

-   <a href="#module-1-introduction" id="toc-module-1-introduction">Module
    1: Introduction</a>
    -   <a href="#examples" id="toc-examples">Examples:</a>
    -   <a href="#statistical-inference-course-take-aways"
        id="toc-statistical-inference-course-take-aways">Statistical Inference
        Course Take Aways</a>
-   <a href="#module-2-probability" id="toc-module-2-probability">Module 2:
    Probability</a>
    -   <a href="#rules-probability-must-follow"
        id="toc-rules-probability-must-follow">Rules probability must follow</a>
    -   <a href="#densities-and-mass-functions"
        id="toc-densities-and-mass-functions">Densities and Mass functions</a>
        -   <a href="#examples-of-variables-that-can-be-thought-of-as-r.v."
            id="toc-examples-of-variables-that-can-be-thought-of-as-r.v.">Examples
            of variables that can be thought of as r.v.</a>
    -   <a href="#the-probability-mass-function-pmf"
        id="toc-the-probability-mass-function-pmf">The Probability Mass Function
        (PMF)</a>
        -   <a href="#the-bernoulli-distribution"
            id="toc-the-bernoulli-distribution">The Bernoulli Distribution</a>
    -   <a href="#the-probability-density-function-pdf"
        id="toc-the-probability-density-function-pdf">The Probability Density
        Function (PDF)</a>
        -   <a href="#example" id="toc-example">Example</a>
    -   <a href="#the-cumulative-distribution-function-cdf"
        id="toc-the-cumulative-distribution-function-cdf">The Cumulative
        Distribution Function (CDF)</a>
    -   <a href="#the-survival-function" id="toc-the-survival-function">The
        Survival Function</a>
    -   <a href="#quantiles" id="toc-quantiles">Quantiles</a>
        -   <a href="#example-1" id="toc-example-1">Example</a>
-   <a href="#module-3-conditional-probability"
    id="toc-module-3-conditional-probability">Module 3: Conditional
    Probability</a>
    -   <a href="#bayes-rule" id="toc-bayes-rule">Bayes’ rule</a>
    -   <a href="#diagnostic-test-sensitivity-specificity"
        id="toc-diagnostic-test-sensitivity-specificity">Diagnostic Test
        (Sensitivity &amp; Specificity)</a>
        -   <a href="#sensitivity" id="toc-sensitivity">Sensitivity</a>
        -   <a href="#specificity" id="toc-specificity">Specificity</a>
        -   <a href="#positive-predictive-value"
            id="toc-positive-predictive-value">Positive Predictive Value</a>
        -   <a href="#negative-predictive-value"
            id="toc-negative-predictive-value">Negative Predictive Value</a>
        -   <a href="#prevalence-of-disease"
            id="toc-prevalence-of-disease">Prevalence of disease</a>
        -   <a href="#likelihood-ratios" id="toc-likelihood-ratios">Likelihood
            ratios</a>
    -   <a href="#independence" id="toc-independence">Independence</a>
-   <a href="#module-4-expected-values"
    id="toc-module-4-expected-values">Module 4: Expected Values</a>
    -   <a href="#the-population-mean" id="toc-the-population-mean">The
        population mean</a>
    -   <a href="#the-sample-mean" id="toc-the-sample-mean">The sample mean</a>
        -   <a href="#example-population-mean"
            id="toc-example-population-mean">Example population mean</a>
    -   <a href="#facts-about-expected-values"
        id="toc-facts-about-expected-values">Facts About Expected Values</a>
        -   <a href="#simulation-experiment"
            id="toc-simulation-experiment">Simulation Experiment</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Module 1: Introduction

**Statistical inference** - the process of generating conclusions about
a population from a noisy sample.

Statistical inference is the only formal system of inference that we
have.

-   Without statistical inference:
    -   we are simply living within our data.
-   With statistical inference:
    -   we are trying to generate new knowledge, extending beyond our
        data to a population, to give answers.
    -   the estimators have actual things that they’re estimating.

### Examples:

-   Predicting who’s going to win an election on election day, given a
    sample of likely voters today. In this case, the sample is a *noisy
    data set* (some people might not vote on the election day, some
    people might be deliberatly misleading, some people might change
    their mind as to wehat they’re going to say). Statistical inference
    allows to measure all that uncertainty and use it for a more
    accurate prediction.

-   Weather predictions are using the historical data that is
    particularly the most recent data in order to predict tomorrow’s
    weather and attach a probability to it. The probability referes to a
    population.

-   Predicting what areas of the brain activate when they are examined
    in a fMRI scanner. For example, figuring out what areas of the brain
    are associated with finger tapping or something like that.

There are many different modes of statistical inference. **Bayesians**
and **frequentists** use two different kinds of inferential paradigms.
However, among them there is all different variations ans shades of
grays.

This module is using the **frequentist** paradigm, which is the most
commonly taught in introductory statistics classes. The frequentist
style of thinking probability is like how we think of gambling. The
probability of a coin winds up as head is going to be defined as the
**proportion** of heads after it has been flipped maybe infinitely many
times; this would define a sort of **intrinsic** probability of the head
to the coin. This is the frequentist style of thinking. The Bayesian
approach is fundamentally different and defines probabilities as
**degree of beliefs** that can be changed (updated) based on new
evidence.

The frequentist way of thinking about the probabilities involves the
idea that the experiment (in this case flipping a coin) can be repeated
over and over again and the percentage of times something happens(in
this case winding up as head) defines that event’s probability. This is
again fundamentally different from the way the notion of probability is
approached in the Bayesian framework, where the fact that some
experiments can’t be repeated infinitely many times is acknowledged and
the probability is viewed as representing or quantifing a degree of
belief.

The main idea is that there are multiple way to think about probability
and inference but this module is focused on the frequentiest
methodology.

## Statistical Inference Course Take Aways

This course provides three things:

1.  an introduction to the key ideas behind working with data in a
    scientific way, producing new and reproducible insight.

2.  an introduction to the tools that will allow you to execute on a
    data analytic strategy, from raw data in a database to a completed
    report with interactive graphics.

3.  hands-on practice so you can learn the techniques for yourself.

# Module 2: Probability

Given a random experiment (e.g. rolling a die) a **probability**
measures the **population** quantity that summarizes the randomness.

The word **population** refferes, in the context of rolling a die, to
the fact that we think of it as intrinsic property of the die, not of
something that is a function of a simple set of fixed rolls of the die.
When we talk about probability, we do no talk about something that is in
the data that we have, but as a conceptual thing that exists in the
population that we want to estimated.

Probability take a possible outcome from an experiment and: \* assigns
it a number between 0 and 1 \* so that the probability that *something*
occurs is 1 (the die must be rolled) and \* so that the probability of
the union of any two sets of outcomes that have nothing in common
(mutually exclusive) is the sum of their respective probabilities.

### Rules probability must follow

-   The probability that *nothing* occurs is 0.
-   The probability that *something* occurs is 1.  
-   The probability of *something* is 1 minus the probability that the
    opposite occurs.
-   (**Mutually exclussive**) The probability of at least one of two (or
    more) things that can not simultaneously occur is the sum of their
    respective probabilities.  
-   If an event A implies the occurrence of event B, then the
    probability of A occurring is less than then the probability of B
    occurring.
-   For any two events the probability that at least one occurs is the
    sum of their probability minues their intersection.

## Densities and Mass functions

Probability calculus is useful for understanding the rules that
probabilities must follow.

We need wasy to model and think about probabilities for numeric outcomes
of exeriments.

Densities and mass functions for random variables are the best starting
point for this.

As mentioned, everything that was mentioned here, represents a
population (intrinsic) quantity, **not** a statement about what occurs
in the data: The data is used in order to estimate properties of the
population.

**Random variable**: a numerical outcome of an experiment.

The random variables can be **discrete** (the ones that can be counted)
or **continous** (can take *any* values in a continuoum).

### Examples of variables that can be thought of as r.v.

-   The (0-1) outcome of the flip of a coin - discrete random variable
    because it can take one of two values
-   The outcome form the role of a die - discrete random variable
    because it can take one of the six possible values.
-   The web site traffic on a given day - discrete random variable,
    i.e. a count random variable with no upper bound on it, generally
    modeled using the Poison distribution.
-   The BMI of a subject four years after a baseline measurement -
    continous random variable
-   The hypertension status of a subject randomly drawn from a
    population (1 if it is diagnosed with hypertension or 1 otherwise) -
    discrete
-   The number of people who click on an ad - discrete r.v. with no
    upper bound
-   Intelligence quotients for a sample of children - continous r.v.

## The Probability Mass Function (PMF)

A probability mass function evaluated at a value corresponds to the
probability that a r.v. thakes that value. To be a valid PMF function
*p* must satisfy: 1. always larger than or equal to 0 2. the sum of the
possible values that the r.v. can take has to add up to 1.

### The Bernoulli Distribution

In the follwoing, **X** denotes a random variable. The Bernoulli
distribution models a coin flip. The notations used are:

-   **X** = 0 represents tails.
-   **X** = 1 represents heads.

The pmf of a Bernoulli distribution with the parameter *θ* = 1/2 is
given by

$$
\begin{equation}
p(\textbf{X} = x) 
=
\left(\frac{1}{2}\right)^{x}
\left(\frac{1}{2}\right)^{1-x}
,
\quad
x = 0, 1
.
\end{equation}
$$

which corresponds to the probabilities *p*(**X**=1) = 1/2 and
*p*(**X**=0) = 1/2:

$$
\begin{equation}
p(\textbf{X} = 0) = \left(\frac{1}{2}\right)^{0}
\left(\frac{1}{2}\right)^{1} = \frac{1}{2}
,
\quad
p(\textbf{X} = 1) = \left(\frac{1}{2}\right)^{1}
\left(\frac{1}{2}\right)^{0} = \frac{1}{2}
.
\end{equation}
$$

The Bernoulli probability mass function considered above corresponds to
the case where the parameter is *θ* = 1/2, which models the **fair**
coins flips. More general, for a coin that is not necesarily fair, with
the probability of tails being *θ* and the probability of heads being
1 − *θ*, the probability mass function writes

*p*(**X**=*x*) = *θ*<sup>*x*</sup>*θ*<sup>1 − *x*</sup>,  *x* = 0, 1.
which corresponds to the probabilities *p*(**X**=1) = *θ* and
*p*(**X**=0) = 1 − *θ*:

$$
\begin{equation}
p(\textbf{X} = 0) = \left(\frac{1}{2}\right)^{0}
\left(\frac{1}{2}\right)^{1} = \frac{1}{2}
,
\quad
p(\textbf{X} = 1) = \left(\frac{1}{2}\right)^{1}
\left(\frac{1}{2}\right)^{0} = \frac{1}{2}
.
\end{equation}
$$

The Bernoilli distribution is very useful for modelling the prevalence
of something, e.g. for modelling the prevalence of the hypertension, we
might assume that the available sample can be modeled by a Bernoilli
distribution (flip of a coin) with the success probability *θ*. What
statistical inference is about is using the data in order to infer the
the value of *θ*.

## The Probability Density Function (PDF)

A probability density function (PDF) is a function associated with a
continuous random variables.

To be a valid pdf, a function must satisfy: \* It must be larger than or
equal to zero everywhere. \* The total area under it must be one.

Areas under pdfs correspond to probabilities for that random variable.

For example, if we consider that intelligence quotients are **normally**
(𝒩) distributed with a **mean** of 100 and a **standard deviation** of
15, that implies that the population follows a specific bell shaped
looking curve, given by the probability density function

$$
\begin{equation}
f(x)
=
\mathcal{N}
\left(x \mid 100, 15 \right)
=
\frac{1}{15\sqrt{2\pi}}
\exp{
-\frac{1}{2}
\left(\frac{x - 100}{15}\right)^2
}
\end{equation}
$$

which has the following graphics:

    par(bty="l")
    plot(seq(50, 150, by = 0.1), 
         dnorm(seq(50, 150, by = 0.1), 
               mean = 100, sd = 15), 
         type = 'l', lwd = 3, col = 'brown4',
         xlab = 'x', ylab = 'N(x|100,15)')
    points(c(100,100),
           c(0, dnorm(100,100,15)), 
           type='l', lwd = 2, col = 'brown4')
    points(c(85,85),
           c(0, dnorm(85,100,15)), 
           type='l', lwd = 2, col = 'brown4')
    points(c(115,115),
           c(0, dnorm(115,100,15)), 
           type='l', lwd = 2, col = 'brown4')


    title(main = 'Probability density function')

![](Notes1_files/figure-markdown_strict/unnamed-chunk-1-1.png)

For the probability density functions, i.e. for random variables that
are continuous, the probability that the random variable takes any
specific (scalar) value is always zero, because the integral under a
line is zero.

### Example

We consider the following density:

$$
\begin{equation}
f(x)
=
\begin{cases}
2x, \quad \text{for}, 0 &lt; x &lt; 1
\\\\
0, \quad\\;\\; \text{otherwise}
\end{cases}
\end{equation}
$$
which is a triangle shaped distribution and might correspond to the
proportion of help calls that get addressed in a random day by a help
line.

    densityTriangle <- function(x) ifelse(0 < x & x <1, 2*x, 0)
    x <- seq(-0.5, 1.5, by = 0.001)
    par(bty="l")
    plot(x, densityTriangle(x), 
         type = 'l', lwd = 3, col = 'brown4',
         xlab = 'x', ylab = 'Density Triangle')
    title(main = 'Probability density function')

![](Notes1_files/figure-markdown_strict/unnamed-chunk-2-1.png)

The probability that between 20 and 60 percent of the calls get
addressed in a random day is given by the area

    densityTriangle <- function(x) ifelse(0 < x & x <1, 2*x, 0)
    x <- seq(-0.5, 1.5, by = 0.001)
    par(bty="l")
    plot(x, densityTriangle(x), 
         type = 'l', lwd = 3, col = 'brown4',
         xlab = 'x', ylab = 'Density Triangle')
    polygon(c(0.2, 0.6, 0.6, 0.2),
            c(0, 0, densityTriangle(0.6), densityTriangle(0.2)),
            density = 15, angle = 47, col = "brown4")
    title(main = 'Probability density function')

![](Notes1_files/figure-markdown_strict/unnamed-chunk-3-1.png)

*p* = ∫<sub>0.2</sub><sup>0.6</sup>*f*(*x*) = ∫<sub>0.2</sub><sup>0.6</sup>2*x* = .*x*<sup>2</sup>|<sub>0.2</sub><sup>0.6</sup> = 0.36 − 0.04 = 0.32

In particular, the density considered above can be expressed via a
classical density, with support *x* ∈ (0,1) i.e. a Beta distribution
with the shape paramters *α* = 2 and *β* = 1. In general, the Beta
distribution is given by

$$
\begin{equation}
\mathcal{B}\left( x \mid \alpha, \beta \right)
=
\frac
{\Gamma(\alpha + \beta)}
{\Gamma(\alpha)\Gamma(\beta)}
x^{\alpha -1}
x^{\beta -1},
\quad
x \in \left(0, 1\right)
.
\end{equation}
$$
which for *α* = 2 and *β* = 1 corresponds to 2*x*. Therefore, the
probabilty computed above can be easily computed in `R` using the
cumulative distribution function:

    pbeta(.6,2,1)-pbeta(.2,2,1)

    ## [1] 0.32

## The Cumulative Distribution Function (CDF)

The **cumulative distribution function** (CDF) of a random variable *X*,
returns the probability that the random variable is less than or equal
to the value *x*
*F*(*x*) = *P*(*X*&lt;*x*).
Different from the case of the probability mass function and the
probabilty density function, which are defined depending on the nature
of the random variable (discrete or continuous, respectively) the
definition of the cumulative distribution function applies to both
discrete and continuous variables.

## The Survival Function

The **survival function** of a random variable *X* is defined as the
probability that the random variable is greater than the value *x*

*F*(*x*) = *P*(*X*&gt;*x*).
Notice that the survival function can be expressed via the CDF
*S*(*x*) = 1 − *F*(*x*).

## Quantiles

The *α*<sup>th</sup> **quantile** of a distribution with distribution
*F* is the point *x*<sub>*α*</sub> so that
*F*(*x*<sub>*α*</sub>) = *α*.

-   A **percentile** is simply a quantile with *α* expressed as a
    percent.

-   The **median** is the 50<sup>*t**h*</sup> percentile or the
    0.5<sup>th</sup> quantile.

### Example

The 95<sup>*t**h*</sup> percentile of a population distribution is the
value *x*<sub>0.95</sub> such that the probability of a random variable
drawn from that population is less than that value is 0.95,
i.e. *F*(*x*<sub>0.95</sub>) = *P*(*x*&lt;*x*<sub>0.95</sub>) = 0.95

# Module 3: Conditional Probability

Let *B* be an event so that *P*(*B*) &gt; 0.

The conditional probability of an event *A* given that an event *B* has
occured is given by

$$
P(A \mid B) = 
\frac
{P(A \cap B)}
{P(B)}
.
$$
If *A* and *B* are statistically independent, then
*P*(*A*∣*B*) = *P*(*A*), i.e. the new information that the event *B* has
occured gives no information about the probabilty law governing the
event *A*.

## Bayes’ rule

Allows to reverse the role of the conditioning set and the set that we
want the probability of.

$$
P(B \mid A) = \frac{P(A \mid B)P(B)}{P(A \mid B) P(B) + P(A \mid B^{c})P(B^{c})}
.
$$

## Diagnostic Test (Sensitivity & Specificity)

Let + and − be the be the event that the test for a disease is positive
or negative, + representing that the test says the person has the
disease, and − saying that they don’t.

Let’s *D* and *D*<sup>*C*</sup> (D complement) be the event that the
person either does or does not have the disease, respectively.

### Sensitivity

The **sensitivity** is the probability that the test is positive (+)
given that the subject does have the disease (*D*). Sensitivity is a
marker of a good test. We want sensitivity to be high.
Sensitivity = *P*(+∣*D*)

### Specificity

The **specificity** is the probability that the test is negative (−)
given that the subject does not have the disease (*D*<sup>*c*</sup>).
Specificity is a marker of a good test. We want specifificity to be high
as well.

Specificity = *P*(−∣*D*<sup>*c*</sup>)

### Positive Predictive Value

For a positive test for a patient, we are interested in the probability
of the patient having the disease (*D*) given the positive test result
(+). This probability is the **positive predictive value**:

Positive predictive value = *P*(*D*∣+)

### Negative Predictive Value

For a negative test for a patient, we are interested in the probability
of the patient not having the disease (*D*) given the negative test
result (+). This probability is the **negative predictive value**:

Negative predictive value = *P*(*D*<sup>*c*</sup>∣−)

### Prevalence of disease

In the absence of a test, we are interested in the probability of a
patient having the disease (*D*). This (marginal) probability is the
**prevalence of disease**:

Prevalence of disease = *P*(*D*)
\### Example

A study comparing the efficacy of HIV test reports on an experiment
which concluded that the antibody tests have a sensitivity of 99.7 and a
specificity of 98.5 (these are made up numbers). Suppose the prevalence
of HIV is 0.1%. What is the associated positive predictive value (PPV)?

With the Bayes’ formula:
$$
\begin{equation}
\text{PPV} 
= 
P(D \mid +)
=
\frac
{P(+ \mid D)P(D)}
{P(+ \mid D)P(D) + P(+ \mid D^{c})P(D^{c})}
.
\end{equation}
$$

But *P*(+∣*D*<sup>*c*</sup>) can be expressed via the specificity
*P*(−∣*D*<sup>*c*</sup>), via the law of total probability:

*P*(*D*<sup>*c*</sup>) = *P*(+,*D*<sup>*c*</sup>) + *P*(−,*D*<sup>*c*</sup>) = *P*(+∣*D*<sup>*c*</sup>)*P*(*D*<sup>*c*</sup>) + *P*(−∣*D*<sup>*c*</sup>)*P*(*D*<sup>*c*</sup>)

So

1 = *P*(+∣*D*<sup>*c*</sup>) + *P*(−∣*D*<sup>*c*</sup>) ⇒ *P*(+∣*D*<sup>*c*</sup>) = 1 − *P*(−∣*D*<sup>*c*</sup>).

Plugging back in the Bayes’ formula:

$$
\begin{align}
\text{PPV} 
&
=
P(D \mid +)
\\\\
&
=
\frac
{P(+ \mid D)P(D)}
{P(+ \mid D)P(D) + \left\[ 1 - P(- \mid D^{c}) \right\] P(D^{c})}
\\\\
&
=
\frac
{\text{Sensitivity} \times \text{Prevalence}}
{\text{Sensitivity} \times \text{Prevalence}
+ 
\left( 1 - \text{Specificity} \right) \left(1 -  \text{Prevalence} \right)}
\\\\
&
=
\frac
{0.997 \times 0.001}
{0.997 \times 0.001
+ 
0.015 \times 0.999}
=
0.06238268
\end{align}
$$

    (0.997 * 0.001) / (0.997 * 0.001 + 0.015 * 0.999)

    ## [1] 0.06238268

In this population, *a positive test result only suggests a 6%
probability that the subject has the disease*. The low positive
predictor value in this case is explained by the low prevalence of the
disease, *P*(*D*) = 0.001.

However, the prevalence for a particular subject can be different,
depending on the available information concerning that subject (e.g. for
a subject that was an intravenous drug user that routinely had
intercourse with an HIV infected partner, the prevalence it is much
higher which would entail a higher positive predictor value).

In the formula used to derive the positive predictor value, there are
two components: \* the component depending on the prevalence \* the
component that is the objective evidence of the positive test result
(i.e the diagnostic likely ratios)

### Likelihood ratios

The positive predictive value obtained via Bayes’ rule depends only on
the sensitivity (*P*(+∣*D*)*P*(*D*)), specificity
(*P*(+∣*D*<sup>*c*</sup>)) and the prevalence (*P*(*D*)). And the
probability of not having the disease given a positive test can be
computed, via the Bayes’ rule, also using just the sensitivity,
specificity and the prevalence.

$$
\begin{align}
P(D \mid +)
&
=
\frac
{P(+ \mid D)P(D)}
{P(+ \mid D)P(D) + P(+ \mid D^{c})P(D^{c})}
&
\\\\
P(D^{c} \mid +)
&
=
\frac
{P(+ \mid D^{c})P(D^{c})}
{P(+ \mid D)P(D) + P(+ \mid D^{c})P(D^{c})}
\end{align}
$$
The ratio between the two gives

$$
\begin{align}
\frac{P(D \mid +)}
{P(D^{c} \mid +)}
=
\frac
{P(+ \mid D)}
{P(+ \mid D^{c})}
\frac
{P(D)}
{P(D^{c})}
\end{align}
$$

-   The left term of the equality represents the **odds** of disease
    given a positive test result, i.e. the **post-test odds of disease**

-   The first right term of the equality represents the **diagnostic
    likelihood ratio for a postive test result DLR<sub>+</sub>**.

-   The right most term of the equality represents the **odds** of
    disease in the absence of the a test result, i.e. the **pre-test
    odds of disease**

The equality above can then be interpreted as

$$
\begin{align}
\text{post-test odds of disease}
=
\text{DLR}\_{+}
\times
\text{pre-test odds of disease}
\end{align}
$$
For the HIV example, the corresponding diagnostic likelihood ratio plus
is
$$
\begin{align}
\text{DLR}\_{+}
=
\frac{\text{Sensitivity}}{1 - \text{Specificity}}
=
\frac{0.997}{1 - 0.985}
\approx
66
.
\end{align}
$$
Via the formula introduced before, for this HIV example, no matter what
the pre-test odds are, we multiply them times 66 to obtain the post-test
odds, i.e. the hypothesis of disease is 66 times more supported by the
data than the hypothesis of no disease. If the pretest odds are very
small, then still multiplying by 66 will result in a still small number,
though 66 times larger.

For the HIV example, the corresponding diagnostic likelihood ratio minus
is
$$
\begin{align}
\text{DLR}\_{-}
=
\frac{1 - \text{Sensitivity}}{\text{Specificity}}
=
\frac{1-0.997}{0.985}
\approx
0.003
.
\end{align}
$$

In this case, the post-test odds of disease in the light of a negative
test result is now 0.3% that of the pre-test odds of the disease. The
hypothesis of disease is supported 0.003 times that of the hypothesis of
the absence of disease given the negative test result.

## Independence

The event *A* is independent of event *B* if
$$
\begin{align}
P(A \mid B) 
=
P(A)
,\quad
\text{where }
P(B) &gt; 0.
\end{align}
$$
Equivalently, the event *A* is independent of event *B* if

$$
\begin{align}
P(A, B) 
=
P(A)
P(B)
.
\end{align}
$$
\### Example

What is the probability of two consecutive heads on a fair coin?
$$
\begin{align}
A = \\{\text{Head on flip 1} \\}; & \quad P(A) = \frac{1}{2}
\\\\
B = \\{\text{Head on flip 2} \\}; & \quad P(B) = \frac{1}{2}
\\\\
A,B = \\{ \text{Head on flip 1 and 2} \\}; & \quad P(A,B) = P(A) P(B) = \frac{1}{4}
\end{align}
$$

# Module 4: Expected Values

-   The mean is a characterization of the distribution center.
-   The variance and standard deviation are characterization of how
    spread out the distribution is.
-   The sample expected values (i.e. the sample mean and variance) will
    estimate the population versions.

## The population mean

The **expected value** or **mean** of a r.v. is the center of its
distribution.

For a discrete r.v. *X* with pmf *p*(*x*), the expected value is:
$$
\begin{align}
\mathbb{E} \left\[ X \right\]
=
\sum\_{x} x p(x)
.
\end{align}
$$
𝔼\[*X*\] represents the center of mass of a collection of locations and
weights {*x*, *p*(*x*)}.

## The sample mean

The sample mean estimates the population mean. The center of mass of the
**data** is the empirical mean

$$
\begin{align}
\bar{X} = \sum\_{i}^{N} x\_{i} \\, p(x\_{i})
\end{align}
$$

    # library(manipulate)
    # library(ggplot2)
    # data(Galton)
    # myHist <- function(mu){
    #     g <- ggplot(Galton, aes(x = child))
    #     g <- g + geom_histogram(fill = 'salmon',
    #                             binwidth = 1,
    #                             aes(y = ..density..),
    #                             color = 'black')
    #     g <- g + geom_density(size = 2)
    #     g <- g + geom_vline(xintercept = mu, size = 2)
    #     mse <- round(mean((Galton$child - mu)^2), 3)
    #     g <- g + labs(title = paste('mu = ', mu,
    #                                 'MSE = ', mse))
    #     g
    # }    
    #     manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

### Example population mean

Suppose a fair coin is flipped and *X* is declared 0 or 1 corresponding
to a head or a tail, respectively. What is the expected value of X?

$$
\begin{align}
\mathbb{E} \left\[ X \right\]
=
\sum\_{x} x p(x)
=
0 \times \frac{1}{2} + 1 \times \frac{1}{2} 
=
\frac{1}{2}
\end{align}
$$

Suppose a biased coin is flipped and *X* is declared 0 or 1
corresponding to a head or a tail, with probabilities *P*(*X*=1) = *p*
and *P*(*X*=0) = (1−*p*). What is the expected value of X?

$$
\begin{align}
\mathbb{E} \left\[ X \right\]
=
\sum\_{x} x p(x)
=
0 \times (1-p) + 1 \times p
=
p
\end{align}
$$
Suppose that a die is rolled and *X* is the number face up. What is the
expected value of *X*?

$$
\begin{align}
\mathbb{E} \left\[ X \right\]
=
\sum\_{x} x p(x)
=
1 \times \frac{1}{6}
+
2 \times \frac{1}{6}
+
\ldots
+
6 \times \frac{1}{6}
=
3.5
\end{align}
$$
\## Continous Random Variables

For a continuous r.v. *X* with pdf *f*(*x*), the expected value is:
$$
\begin{align}
\mathbb{E} \left\[ X \right\]
=
\int x f(x) \mathrm{d} x
.
\end{align}
$$

Consider the uniform density,

$$
\begin{align}
\mathcal{U}\left(x \mid 0, 1\right)
=
\begin{cases}
1, 0 &lt;= x &lt;= 1
\\\\
0, \text{otherwise}
\end{cases}
\end{align}
$$
The expected value is

$$
\begin{align}
\mathbb{E} \left\[ X \right\]
=
\int\_{0}^{1} x 
=
\frac{1}{2}
\end{align}
$$

## Facts About Expected Values

Recall that expected values are properties of distributiones (center of
mass of distributions).

The average of random variables is itself a random variable and it’s
associated distribution has an expected value.

The center of *this* distribution is the same as that of the original
distribution.

The expected value of the sample mean is exactly the population mean
that it’s trying to estimate, i.e. the population distribution of the
sample mean is centered in the same place as the original population
that the data is drawn from.

The sample mean is <r>unbiased</r> because its distribution is centered
at what it’s trying to estimate.

### Simulation Experiment
