<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Question 1

What is the variance of the distribution of the average an draw of *n*
observations from a population with mean *μ* and variance
*σ*<sup>2</sup>

## Answer 1

$$
\frac{\sigma^2}{n}
$$

## Question 2

Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are
normally distributed with a mean of 80 (mm Hg) and a standard deviation
of 10. About what is the probability that a random 35-44 year old has a
DBP less than 70?

## Answer 2

    pnorm(70, 80, 10)

    ## [1] 0.1586553

## Question 3

Brain volume for adult women is normally distributed with a mean of
about 1,100 cc for women with a standard deviation of 75 cc. What brain
volume represents the 95th percentile?

## Answer 3

    qnorm(0.95, 1100, 75)

    ## [1] 1223.364

## Question 4

Refer to the previous question. Brain volume for adult women is about
1,100 cc for women with a standard deviation of 75 cc. Consider the
sample mean of 100 random adult women from this population. What is the
95th percentile of the distribution of that sample mean?

## Answer 4

    qnorm(0.95, 1100, 7.5)

    ## [1] 1112.336

## Question 5

You flip a fair coin 5 times, about what’s the probability of getting 4
or 5 heads?

## Answer 5

    1 - pbinom(3,5,1/2)

    ## [1] 0.1875

## Question 6

The respiratory disturbance index (RDI), a measure of sleep disturbance,
for a specific population has a mean of 15 (sleep events per hour) and a
standard deviation of 10. They are not normally distributed. Give your
best estimate of the probability that a sample mean RDI of 100 people is
between 14 and 16 events per hour?

## Answer 6

    pnorm(16, 15, 1) - pnorm(14, 15, 1)

    ## [1] 0.6826895

## Question 7

Consider a standard uniform density. The mean for this density is .5 and
the variance is 1 / 12. You sample 1,000 observations from this
distribution and take the sample mean, what value would you expect it to
be near?

## Answer 7

𝔼\[*X̄*\] = *μ* = 0.5

    mean(runif(1000))

    ## [1] 0.5073493

## Question 8

The number of people showing up at a bus stop is assumed to be Poisson
with a mean of 5 people per hour. You watch the bus stop for 3 hours.
About what’s the probability of viewing 10 or fewer people?

## Answer 8

    lambda = 5
    ppois(10,3*lambda)

    ## [1] 0.1184644
