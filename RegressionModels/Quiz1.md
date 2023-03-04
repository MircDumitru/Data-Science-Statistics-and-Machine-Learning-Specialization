<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Question 1

Consider the data set given below (0.18,−1.54,0.42,0.95) and weights
given by (2,1,3,1). Give the value of *μ* that minimizes the least
squares equation $\sum\_{i=1}^{n}\omega\_{i}(x\_i - mu)^2$

## Answer 1

$$
\mu = \frac{\sum\_{i=1}^{n} \omega\_i x\_i}{\sum\_{i=1}^{n} \omega\_i^2}
$$

    x <- c(0.18, -1.54, 0.42, 0.95)
    w <- c(2, 1, 3, 1)
    mu <- sum(x*w)/sum(w)
    mu

    ## [1] 0.1471429

## Question 2

Consider the following data set

    x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
    y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

Fit the regression through the origin and get the slope treating *y* as
the outcome and x as the regressor. (Hint, do not center the data since
we want regression through the origin, not through the means of the
data.)

$$
\beta = \frac{\sum\_{i=1}^{n}x\_i y\_i}{\sum\_{i=1}^{n}x\_i^2}
$$

## Answer 2

    beta = sum(x*y)/sum(x^2)
    rbind(beta, coef(lm(y~x-1)))

    ##              x
    ## beta 0.8262517
    ##      0.8262517

## Question 3

Do `data(mtcars)` from the datasets package and fit the regression model
with mpg as the outcome and weight as the predictor. Give the slope
coefficient.

## Answer 3

    data("mtcars")
    coef(lm(mpg~wt, data = mtcars))[2]

    ##        wt 
    ## -5.344472

## Question 4

Consider data with an outcome (*Y*) and a predictor (*X*). The standard
deviation of the predictor is one half that of the outcome. The
correlation between the two variables is .5. What value would the slope
coefficient for the regression model with *Y* as the outcome and *X* as
the predictor?

## Answer 4

Because the standard deviation of the predictor is one half that of the
outcome,
$$
s\_x = \frac{1}{2} s\_y
$$
hence

$$
\beta\_1 
= 
\text{Cor} \left\[x, y \right\]\frac{s\_y}{s\_x}
= 
0.5 \times 2 
= 
1
$$

## Question 5

Students were given two hard tests and scores were normalized to have
empirical mean 0 and variance 1. The correlation between the scores on
the two tests was 0.4. What would be the expected score on Quiz 2 for a
student who had a normalized score of 1.5 on Quiz 1?

## Answer 5

1.5 \* 0.4 = 0.6

## Question 6

Consider the data given by the following

    x <- c(8.58, 10.46, 9.01, 9.64, 8.86)

What is the value of the first measurement if x were normalized (to have
mean 0 and variance 1)?

## Answer 6

    mu <- mean(x)
    sd <- sd(x)
    (x[1]-mu)/sd

    ## [1] -0.9718658

## Question 7

Consider the following data set (used above as well). What is the
intercept for fitting the model with *x* as the predictor and *y* as the
outcome?

    x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
    y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

## Answer 7

    beta1 <- cor(x,y)* sd(y)/sd(x)
    beta0 <- mean(y) - beta1 * mean(x)
    rbind(beta0, coef(lm(y~x))[1])

    ##       (Intercept)
    ## beta0    1.567461
    ##          1.567461

## Question 8

You know that both the predictor and response have mean 0. What an be
said about the intercept when you fit a linear regression?

## Answer 8

It must be identically 0.

## Question 9

Consider the data given by

    x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

What value minimizes the sum of the squared distances between these
points and itself?

## Answer 9

    mean(x)

    ## [1] 0.573

## Question 10

Let the slope having fit Y as the outcome and X as the predictor be
denoted as *β*<sub>1</sub>. Let the slope from fitting *X* as the
outcome and *Y* as the predictor be denoted as *γ*<sub>1</sub>. Suppose
that you divide *β*<sub>1</sub> by *γ*<sub>1</sub>, in other words
consider *β*<sub>1</sub>/*γ*<sub>1</sub>. What is this ratio always
equal to?

## Answer 10

$\beta\_1 = \text{Cor}\left\[ X, Y \right\] \frac{s\_Y}{s\_X}$ and
$\gamma\_1 = \text{Cor}\left\[ X, Y \right\] \frac{s\_X}{s\_Y}$ hence
$$
\frac{\beta\_1}{\gamma\_1}
=
\frac{s\_Y/s\_X}{s\_X/s\_Y}
=
\frac{s\_Y^2}{s\_X^2}
=
\frac{\mathbb{V}\[Y\]}{\mathbb{V}\[X\]}
$$
