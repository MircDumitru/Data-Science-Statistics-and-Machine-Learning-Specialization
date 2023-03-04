<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Question 1

Consider the following data with *x* as the predictor and *y* as as the
outcome.

    x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
    y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

Give a *p*-value for the two sided hypothesis test of whether
*β*<sub>1</sub> from a linear regression model is 0 or not.

## Answer 1

Directly, using the `lm` and extracting the coefficients from the
`summary`:

    fit <- lm(y~x)
    summary(fit)$coefficients[2,4]

    ## [1] 0.05296439

Computing using the formulas:

    # Compute the number of samples
    n <- length(x)
    # Compute the slope beta1 via the correlation and the standard deviations
    beta1 <- cor(x,y) * sd(y) / sd(x)
    # Compute the intercept beta10 via the slope and the means
    beta0 <- mean(y) - beta1 * mean(x)
    # Compute the predicted response yh
    yh <- beta0 + beta1 * x
    # Compute the residuals
    epsilon <- y - yh
    # Compute the (estimated) standard deviation for the residuals
    sigmaEst <- sqrt(sum(epsilon**2) / (n-2))
    # Compute the (estimated) standard deviation for the predictors (i.e. for x)
    sx <- sum((x-mean(x))**2)
    # Compute the standard error for the slope
    seBeta1 <- sigmaEst / sqrt(sx)
    # Compute the t value for the slope
    tBeta1 <- beta1 / seBeta1
    # Compute the p value for the slope
    pBeta1 <- 2 * pt(abs(tBeta1), df = n-2, lower.tail = FALSE)
    pBeta1

    ## [1] 0.05296439

## Question 2

Consider the previous problem, give the estimate of the residual
standard deviation.

## Answer 2

Directly, using the `lm` and extracting the coefficients from the
`summary`:

    fit <- lm(y~x)
    summary(fit)$sigma

    ## [1] 0.2229981

Computing using the formulas:

    # Compute the number of samples
    n <- length(x)
    # Compute the slope beta1 via the correlation and the standard deviations
    beta1 <- cor(x,y) * sd(y) / sd(x)
    # Compute the intercept beta10 via the slope and the means
    beta0 <- mean(y) - beta1 * mean(x)
    # Compute the predicted response yh
    yh <- beta0 + beta1 * x
    # Compute the residuals
    epsilon <- y - yh
    epsilon

    ## [1]  0.04086597 -0.02030878 -0.18806667 -0.26130455  0.27143544  0.16595545
    ## [7]  0.25413964  0.01364175 -0.27635825

    sum(epsilon**2)/(n-2)

    ## [1] 0.04972814

## Question 3

In the `mtcars` data set, fit a linear regression model of weight
(predictor) on mpg (outcome). Get a 95% confidence interval for the
expected mpg at the average weight. What is the lower endpoint?

## Answer 3

    data(mtcars)
    x <- mtcars$wt
    y <- mtcars$mpg
    fit <- lm(formula = y ~ I(x-mean(x)))
    summary(fit)

    ## 
    ## Call:
    ## lm(formula = y ~ I(x - mean(x)))
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.5432 -2.3647 -0.1252  1.4096  6.8727 
    ## 
    ## Coefficients:
    ##                Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)     20.0906     0.5384  37.313  < 2e-16 ***
    ## I(x - mean(x))  -5.3445     0.5591  -9.559 1.29e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.046 on 30 degrees of freedom
    ## Multiple R-squared:  0.7528, Adjusted R-squared:  0.7446 
    ## F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10

    confint(fit)

    ##                    2.5 %    97.5 %
    ## (Intercept)    18.990982 21.190268
    ## I(x - mean(x)) -6.486308 -4.202635

    new <- data.frame(x = c(mean(x)))
    pred <- predict(fit, new, interval = ('confidence'))
    summary(pred)[1,2]

    ## [1] "Min.   :18.99  "

## Question 4

Refer to the previous question. Read the help file for `mtcars`. What is
the weight coefficient interpreted as?

## Answer 4

The estimated expected change in mpg per 1,000 lb increase in weight.

## Question 5

Consider again the `mtcars` data set and a linear regression model with
mpg as predicted by weight (1,000 lbs). A new car is coming weighing
3000 pounds. Construct a 95% prediction interval for its mpg. What is
the upper endpoint?

## Answer 5

    data(mtcars)
    x <- mtcars$wt
    y <- mtcars$mpg
    fit <- lm(formula = y ~ x)
    new <- data.frame(x = 3)
    pred <- predict(fit, new, interval = ('prediction'))
    pred

    ##        fit      lwr      upr
    ## 1 21.25171 14.92987 27.57355

## Question 6

Consider again the `mtcars` data set and a linear regression model with
mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as
2,000 lbs. Construct a 95% confidence interval for the expected change
in mpg per 1 short ton increase in weight. Give the lower endpoint.

## Answer 6

    data(mtcars)
    x <- mtcars$wt
    y <- mtcars$mpg

    fit <- lm(formula = y ~ x)
    confint(fit)[2, ] /(1/2)

    ##     2.5 %    97.5 % 
    ## -12.97262  -8.40527

    fit <- lm(formula = y ~ I(x * 1/2))
    confint(fit)[2, ] 

    ##     2.5 %    97.5 % 
    ## -12.97262  -8.40527

    fit <- lm(formula = y ~ x)
    sumCoef <- summary(fit)$coefficients
    (sumCoef[2,1] + c(-1,1) * qt(0.975, df = fit$df) * sumCoef[2,2])/(1/2)

    ## [1] -12.97262  -8.40527

## Question 7

If my *X* from a linear regression is measured in centimeters and I
convert it to meters what would happen to the slope coefficient?

## Answer 7

The multiplication of *X* by a factor *α* results in dividing the slope
coffecient by a factor of *α*. In this case, the conversion from
centimenters to meters means the multiplication by 0.01 hence the slope
coffecient is divided by 0.01, i.e. multiplied by 100.

## Question 8

I have an outcome, *Y* and a predictor, *X* and fit a linear regression
model with *Y* = *β*<sub>0</sub> + *β*<sub>1</sub>*X* + *ϵ* to obtain
$\widehat{\beta\_0}$ and $\widehat{\beta\_1}$. What would be the
consequence to the subsequent slope and intercept if I were to refit the
model with a new regressor, *X* + *c* for some constant, *c*?

## Answer 8

The new intercept would be $\widehat{\beta\_0} - c\widehat{\beta\_1}$.

## Question 9

Refer back to the mtcars data set with mpg as an outcome and weight (wt)
as the predictor. About what is the ratio of the the sum of the squared
errors, $\sum\_{i=1}^{n} \left( Y\_i - \widehat{Y\_i} \right)^2$ when
comparing a model with just an intercept (denominator) to the model with
the intercept and slope (numerator)?

## Answer 9

The sum of the squared errors for a model with just an intercept
(denominator) is $\sum\_{i=1}^{n} \left( Y\_i - \bar{Y} \right)^2$ (in
this case the prediction is simply the average).

The sum of the squared errors for a model with the intercept and slope
is $\sum\_{i=1}^{n} \left( Y\_i - \widehat{Y}\_i \right)^2$

The ratio we look for is
$$
\frac{\sum\_{i=1}^{n} \left( Y\_i - \widehat{Y}\_i \right)^2}{\sum\_{i=1}^{n} \left( Y\_i - \bar{Y} \right)^2}
$$
Since
$$
\sum\_{i=1}^{n} \left( Y\_i - \bar{Y} \right)^2
=
\sum\_{i=1}^{n} \left( \widehat{Y}\_i - \bar{Y} \right)^2
+
\sum\_{i=1}^{n} \left( Y\_i - \widehat{Y}\_i \right)^2
\Rightarrow
1 = R^2 + \frac{\sum\_{i=1}^{n} \left( Y\_i - \widehat{Y}\_i \right)^2}{\sum\_{i=1}^{n} \left( Y\_i - \bar{Y} \right)^2}
$$

the ratio can be computed as 1 − *R*<sup>2</sup>.

    data(mtcars)
    x <- mtcars$wt
    y <- mtcars$mpg
    fit <- lm(formula = y ~ x)
    1-summary(fit)$r.squared

    ## [1] 0.2471672

    fit1 <- lm(mpg ~ wt, data = mtcars)
    sse1 <- sum((predict(fit1) - mtcars$mpg)^2)

    fit2 <- lm(mpg ~ 1, data = mtcars)
    sse2 <- sum((predict(fit2) - mtcars$mpg)^2)

    sse1/sse2

    ## [1] 0.2471672

## Question 10

Do the residuals always have to sum to 0 in linear regression?

## Answer 10

If an intercept is included, then they will sum to 0.
