



-   <a href="#module-1-introduction-to-regression-least-squares"
    id="toc-module-1-introduction-to-regression-least-squares">Module 1:
    Introduction to Regression &amp; Least Squares</a>
    -   <a href="#galtons-data" id="toc-galtons-data">Galton’s Data</a>
        -   <a href="#finding-the-middle-via-least-squares"
            id="toc-finding-the-middle-via-least-squares">Finding the middle via
            least squares</a>
        -   <a href="#comparing-childerens-height-and-their-parents-heights"
            id="toc-comparing-childerens-height-and-their-parents-heights">Comparing
            childeren’s height and their parents heights</a>
        -   <a href="#regression-to-the-origin"
            id="toc-regression-to-the-origin">Regression to the origin</a>
-   <a href="#module-2-linear-least-squares"
    id="toc-module-2-linear-least-squares">Module 2: Linear Least
    Squares</a>
    -   <a href="#least-squares-estimation-of-regression-lines"
        id="toc-least-squares-estimation-of-regression-lines">Least squares
        estimation of regression lines</a>
-   <a href="#module-3-regression-to-the-mean"
    id="toc-module-3-regression-to-the-mean">Module 3: Regression to the
    Mean</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Module 1: Introduction to Regression & Least Squares

Regression models are the workhorse of data science. They are the most
well described, practical and theoretically understood models in
statistics.

One of the key insight for regression models is that they produce
**highly interpretable model fits**, unlike machine learning algorithms,
which often **sacrifice interpretability for improved prediction
performance or automation**, which are valuable attributes in their own
rights.

The benefit of **simplicity**, **parsimony** and **intrepretability**
offered by regression models (and their close generalizations) typically
makes them a first tool of choice for any practical problem.

Regression history starts with the work of **Francis Galton**, who used
the parent’s heights to predict the children’s heights and invented the
term and the concept **regression**, and the term and the concept
**correlation**, intimately tied to linear regression.

The type of questions regression analysis can answer, using the parents
and children heights dataset used by Francis Galton.

1.  Use a parent’s height to **predict** their children’s heights.

2.  Find a **parsimonious and easily described** mean **relationships**
    between the parent’s and child’s height.

3.  Find the variation that’s unexplained by the regression model, the
    so called **residual variation**.

4.  Quantify the impact the genotype information has beyond parental
    height explaining child’s height.

5.  Why do children of very tall parents tend to be tall, but a little
    bit shorter than their parents (**regression to the mean**).

## Galton’s Data

    install.packages(c('UsingR', 'reshape'),
                     repos = "http://cran.us.r-project.org")

    library(UsingR)
    library(reshape)
    data(galton)
    galtonM <- melt(galton)

    g <- ggplot(galtonM, 
                aes(x = value, fill = variable))
    g <- g + geom_histogram(colour = 'black',
                            binwidth = 1)
    g <- g + facet_grid(.~variable)
    g

![](Notes1_files/figure-markdown_strict/unnamed-chunk-2-1.png)

### Finding the middle via least squares

Consider only the children’s heights.

-   How could one describe the middle?
-   One definition, let *Y*<sub>*i*</sub> be the height of child *i* for
    *i* = 1, …, *n* = 928, then define the middle as the value of *μ*
    that minimizes:
    $$
    \sum\_{i=1}^{n} \left( Y\_i - \mu \right)^2
    $$
-   This is the physical center of mass of the histogram.
-   The answer is *μ* = *Ȳ*.

$$
\begin{align}
\sum\_{i=1}^{n} \left( Y\_i - \mu \right)^2
&
=
\sum\_{i=1}^{n} \left( Y\_i - \bar{Y} + \bar{Y}- \mu \right)^2
\\\\
&
=
\sum\_{i=1}^{n}
\left( Y\_i - \bar{Y} \right)^2 
+
2 
\left(\bar{Y} - \mu \right)
\sum\_{i=1}^{n} 
\left( Y\_i - \bar{Y} \right)
+
\sum\_{i=1}^{n} 
\left(\bar{Y} - \mu \right)^2
\\\\
&
=
\sum\_{i=1}^{n}
\left( Y\_i - \bar{Y} \right)^2 
+
n
\left(\bar{Y} - \mu \right)^2
\\\\
&
\geq
\sum\_{i=1}^{n}
\left( Y\_i - \bar{Y} \right)^2 
\end{align}
$$
with the equality for

$$
\begin{align}
\bar{Y} - \mu = 0
\end{align}
$$
i.e. the unique minimizer is *Ȳ* = *μ*.

### Comparing childeren’s height and their parents heights

    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following object is masked from 'package:reshape':
    ## 
    ##     rename

    ## The following objects are masked from 'package:Hmisc':
    ## 
    ##     src, summarize

    ## The following object is masked from 'package:MASS':
    ## 
    ##     select

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## Create a dataframe corresponding to frequencies of each pair (child, parent) and set the names accordingly
    freqData <- as.data.frame(table(galton$child, galton$parent))
    names(freqData) <- c("child", "parent", "freq")

    ## Transform both the child and parents hight variables to numeric class.
    freqData$child <- as.numeric(as.character(freqData$child))
    freqData$parent <- as.numeric(as.character(freqData$parent))

    g <- ggplot(filter(freqData, freq > 0), 
                aes(x = parent, y = child))
    g <- g  + scale_size(range = c(2, 10), 
                         guide = "none" )
    g <- g + geom_point(aes(colour=freq, 
                            size = freq))
    g <- g + scale_colour_gradient(low = "salmon",
                                   high="white")  

    g <- g + ggtitle("Parents-Children Height Frequency") + xlab("Parent's high [inches]") + ylab("Childern's high [inches]")

    g

![](Notes1_files/figure-markdown_strict/unnamed-chunk-3-1.png)

### Regression to the origin

    library(dplyr)
    ## Create a dataframe corresponding to frequencies of each pair (child, parent) and set the names accordingly
    freqData <- as.data.frame(table(galton$child, galton$parent))
    names(freqData) <- c("child", "parent", "freq")

    ## Transform both the child and parents hight variables to numeric class.
    freqData$child <- as.numeric(as.character(freqData$child))
    #freqData$child <- freqData$child - mean(freqData$child)

    freqData$parent <- as.numeric(as.character(freqData$parent))
    #freqData$parent <- freqData$parent - mean(freqData$parent)

    g <- ggplot(filter(freqData, freq > 0), 
                aes(x = parent, y = child))
    g <- g  + scale_size(range = c(2, 10), 
                         guide = "none" )
    g <- g + geom_point(aes(colour=freq, 
                            size = freq))
    g <- g + scale_colour_gradient(low = "salmon",
                                   high="white")  
    g <- g + geom_smooth(method='lm', 
                         formula = y ~ x,
                         se = TRUE)

    g <- g + ggtitle("Parents-Children Height Frequency")

    g

![](Notes1_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    lm(I(child - mean(child)) ~ I(parent - mean(parent)), data = galton)

    ## 
    ## Call:
    ## lm(formula = I(child - mean(child)) ~ I(parent - mean(parent)), 
    ##     data = galton)
    ## 
    ## Coefficients:
    ##              (Intercept)  I(parent - mean(parent))  
    ##                3.062e-14                 6.463e-01

    lm(I(child - mean(child)) ~ I(parent - mean(parent)) - 1, data = galton)

    ## 
    ## Call:
    ## lm(formula = I(child - mean(child)) ~ I(parent - mean(parent)) - 
    ##     1, data = galton)
    ## 
    ## Coefficients:
    ## I(parent - mean(parent))  
    ##                   0.6463

# Module 2: Linear Least Squares

-   We write *X*<sub>1</sub>, *X*<sub>2</sub>, …*X*<sub>*n*</sub>, to
    describe *n* data points, but there is nothing special about the
    letter *X* and often different letter is used such as
    *Y*<sub>1</sub>, *Y*<sub>2</sub>, …*Y*<sub>*n*</sub>.

-   We typically use Greek letters for things we don’t know, such as *μ*
    is a mean that we’d like to estimate.

-   The empirical mean is defind as
    $$
    \bar{X} = \frac{1}{n} \sum\_{i=1}^{n} X\_i
    $$

Notice that if we substract the mean from data points we get data set
that is *centered*, i.e. a data set that has a corresponding (empirical)
mean 0. That is, if

*X̄*<sub>*i*</sub> = *X*<sub>*i*</sub> − *X̄*,
the empirical mean of the new dataset
*X̄*<sub>1</sub>, *X̄*<sub>2</sub>, …*X̄*<sub>*n*</sub> is 0. This process
is called *centering* the random variable.

-   The mean is the least squares solution for minimizing
    $$
    \sum\_{i=1}^{n}
    \left( X\_i - \mu \right)^2
    $$

-   The empirical variance is defind as
    $$
    s^2 
    = 
    \frac{1}{n-1}
    \sum\_{i=1}^{n} 
    \left( 
    X\_i - \bar{X} 
    \right)^2
    =
    \frac{1}{n-1}
    \left(
    \sum\_{i=1}^{n} X\_{i}^{2} - n \bar{X}^{2} 
    \right)^{2}
    $$

-   The empirical standard deviation is defind as *s*. The standard
    deviation has the same units as the data.

-   The data defined by *X*<sub>*i*</sub>/*s* have empirical standard
    deviation 1. This is *scaling* the data.

-   Centering and scaling the data leads to empirical mean zero and
    empirical standard deviation one data. This is called
    *normalization*, i.e. the data defined by
    $$
    Z\_i
    =
    \frac{X\_i - \bar{X}}{s}
    $$
    have empirical mean zero and empirical standard deviation 1.
    Normalized data are centered at 0 and have units equal to standard
    deviations of the original data.

-   The empirical covariance is defined for pairs of data,
    (*X*<sub>*i*</sub>,*Y*<sub>*i*</sub>):
    $$
    \text{Cov}\left\[ X, Y \right\]
    =
    \frac{1}{n-1}
    \sum\_{i=1}^{n}
    \left( X\_i - \bar{X} \right)
    \left( Y\_i - \bar{Y} \right)
    =
    \frac{1}{n-1}
    \left( \sum\_{i=1}^{n} X\_i Y\_i - n \bar{X} \bar{Y} \right).
    $$

-   The correlation is a measure of strength of the linear relationship
    between the random variabls and is defined as:
    $$
    \text{Cor}\left\[ X, Y \right\]
    =
    \frac{\text{Cov}\left\[ X, Y \right\]}{s\_x s\_y}
    $$

-   Some properties of the correlation:

    -   Cor\[*X*,*Y*\] = Cor\[*Y*,*X*\].
    -    − 1 ≤ Cor\[*X*,*Y*\] ≤ 1.
    -   Cor\[*X*,*Y*\] = 1 or Cor\[*X*,*Y*\] =  − 1 only when the
        observations (*X*<sub>*i*</sub>,*Y*<sub>*i*</sub>) fall perfecty
        on a positive or negative sloped line.
    -   Cor\[*X*,*Y*\] = 0 means no linear relationship.

## Least squares estimation of regression lines

We consider the parents-childern height data set again.

Let *Y*<sub>*i*</sub> be the *i*th child’s height and *X* be the *i*th
parent’s height. Consider finde the best line
Child’s height = *β*<sub>0</sub> + Parent’s height × *β*<sub>1</sub>
Using least squares means minimizing the residuals errors,
i.e. minimizing
$$
\sum\_{i=1}^{n}
\left( Y\_i - \left(\beta\_0 + \beta\_1 X\_i \right)\right)^2
$$

The least squares model fitting the line
*Y* = *β*<sub>0</sub> + *β*<sub>1</sub>*X* through the data pairs
(*X*<sub>*i*</sub>,*Y*<sub>*i*</sub>), with *Y*<sub>*i*</sub> as the
outcome, obtains the line
*Y* = *β̂*<sub>0</sub> + *β̂*<sub>1</sub>*X*
where
$$
\widehat{\beta}\_{1} 
=
\text{Cor}\left\[ X, Y\right\]
\frac{\text{sd}(Y)}{\text{sd}(X)}
,\quad
\widehat{\beta}\_{0}
=
\bar{Y}
-
\widehat{\beta}\_{1} 
\bar{X}
$$

The criterion to be minimized is
$$
\begin{align}
J \left(\beta\_0, \beta\_1 \right)
=
\sum\_{i=1}^{n}
\left( Y\_i - \beta\_0 - \beta\_1 X\_i \right)^2
\end{align}
$$

and the partial derivatives of *J*(*β*<sub>0</sub>,*β*<sub>1</sub>) with
respect to *β*<sub>0</sub> and *β*<sub>1</sub> set to zero lead to

$$
\frac{\text{d} J \left(\beta\_0, \beta\_1 \right)}{\text{d} \beta\_0}
=
0
\Leftrightarrow
\sum\_{i=1}^{n}
\left( Y\_i - \beta\_0 - \beta\_1 X\_i \right)
=
0
\Leftrightarrow
\beta\_0
=
\frac{1}{n} \sum\_{i=1}^{n} Y\_i 
- 
\beta\_1
\frac{1}{n} \sum\_{i=1}^{n} Y\_i 
\Leftrightarrow
\beta\_0
=
\bar{Y} - \beta\_1 \bar{X}
\\\\
\frac{\text{d} J \left(\beta\_0, \beta\_1 \right)}{\text{d} \beta\_1}
=
0
\Leftrightarrow
\sum\_{i=1}^{n}
X\_i \left( Y\_i - \beta\_0 - \beta\_1 X\_i \right)
=
0
\Leftrightarrow
\beta\_1 \sum\_{i=1}^{n} X\_i^2
=
\sum\_{i=1}^{n} X\_i Y\_i - \beta\_0 \sum\_{i=1}^{n}X\_i
$$
Plugging the *β*<sub>0</sub> from the first equality into the second one
leads to:

$$
\beta\_1 \sum\_{i=1}^{n} X\_i^2
=
\sum\_{i=1}^{n} X\_i Y\_i - (\bar{Y} - \beta\_1 \bar{X}) \sum\_{i=1}^{n}X\_i
\Leftrightarrow
\beta\_1 \left( \sum\_{i=1}^{n} X\_i^2 - n \bar{X}^2 \right)
=
\sum\_{i=1}^{n} X\_i Y\_i - n\bar{X}\bar{Y}
\Leftrightarrow
\beta\_1
=
\frac
{
\sum\_{i=1}^{n} \left( X\_i - \bar{X} \right)\left( Y\_i - \bar{Y} \right)
}
{
\sum\_{i=1}^{n} \left( X\_i - \bar{X} \right)^2
}
$$
By adding 1/(*n*−1) in both the numerator and denominator, the estimated
*β̂*<sub>1</sub>, minimizing the criterion, can be expressed via the
sample covariance of *X* and *Y*, denoted *q*<sub>*X*, *Y*</sub> and the
sample variance of *X*, denoted *s*<sub>*X*</sub><sup>2</sup>, or via
the sample correlation *r*<sub>*X*, *Y*</sub>

$$
\widehat{\beta}\_1
=
\frac
{
\sum\_{i=1}^{n} \left( X\_i - \bar{X} \right)\left( Y\_i - \bar{Y} \right)
}
{
\sum\_{i=1}^{n} \left( X\_i - \bar{X} \right)^2
}
=
\frac{q\_{X,Y}}{s\_{X}^2}
=
\frac{q\_{X,Y}}{s\_{X}s\_{Y}} \frac{s\_{Y}}{s\_X}
=
r\_{X,Y} \frac{s\_{Y}}{s\_X}
,
$$
Plugging *β̂*<sub>1</sub> back in the first equation gives the estimated
*β̂*<sub>0</sub>:

*β̂*<sub>0</sub> = *Ȳ* − *β̂*<sub>1</sub>*X̄*

-   *β̂*<sub>1</sub> has the units of *Y*/*X*

-   *β̂*<sub>0</sub> has the units of *Y*

-   The line passes throug the point (*X̄*,*Ȳ*)

-   The slope of the regression line with *X* as the outcome and *Y* as
    the the predictior is
    $$
    \widehat{\beta}\_{1} 
    =
    \text{Cor}\left\[ X, Y\right\]
    \frac{\text{sd}(X)}{\text{sd}(Y)}
    $$

-   The slope is the same one if data is centered.

-   The slope corresponding to normalized data is
    Cor\[*X*,*Y*\]

<!-- -->

    ## Create a dataframe corresponding to frequencies of each pair (child, parent) and set the names accordingly
    freqData <- as.data.frame(table(galton$child, galton$parent))
    names(freqData) <- c("child", "parent", "freq")

    ## Transform both the child and parents hight variables to numeric class.
    freqData$child <- as.numeric(as.character(freqData$child))
    #freqData$child <- freqData$child - mean(freqData$child)

    freqData$parent <- as.numeric(as.character(freqData$parent))
    #freqData$parent <- freqData$parent - mean(freqData$parent)

    g <- ggplot(filter(freqData, freq > 0), 
                aes(x = parent, y = child))
    g <- g  + scale_size(range = c(2, 10), 
                         guide = "none" )
    g <- g + geom_point(aes(colour=freq, 
                            size = freq))
    g <- g + scale_colour_gradient(low = "salmon",
                                   high="white")  
    g <- g + ggtitle("Parents-Children Height Frequency")

    g

![](Notes1_files/figure-markdown_strict/unnamed-chunk-7-1.png)

    x <- galton$parent
    y <- galton$child

    beta1 <- cor(x,y) * sd(y) / sd(x)
    beta0 <- mean(y) - beta1 * mean(x)
    rbind(c(beta0,beta1), coef(lm(y~x)))

    ##      (Intercept)         x
    ## [1,]    23.94153 0.6462906
    ## [2,]    23.94153 0.6462906

    x <- galton$parent
    y <- galton$child

    beta1 <- cor(x,y) * sd(x) / sd(y)
    beta0 <- mean(x) - beta1 * mean(y)
    rbind(c(beta0,beta1), coef(lm(x~y)))

    ##      (Intercept)         y
    ## [1,]    46.13535 0.3256475
    ## [2,]    46.13535 0.3256475

    xc <- x - mean(x)
    yc <- y - mean(y)

    beta1 <- cor(xc, yc)* sd(yc) / sd(xc)
    c(beta1, coef(lm(yc~xc))[2])

    ##                  xc 
    ## 0.6462906 0.6462906

    xn <- (x - mean(x))/sd(x)
    yn <- (y - mean(y))/sd(y)

    c(cor(x, y), cor(xn, yn), coef(lm(yn~xn))[2])

    ##                            xn 
    ## 0.4587624 0.4587624 0.4587624

    ## Create a dataframe corresponding to frequencies of each pair (child, parent) and set the names accordingly
    freqData <- as.data.frame(table(galton$child, galton$parent))
    names(freqData) <- c("child", "parent", "freq")

    ## Transform both the child and parents hight variables to numeric class.
    freqData$child <- as.numeric(as.character(freqData$child))
    #freqData$child <- freqData$child - mean(freqData$child)

    freqData$parent <- as.numeric(as.character(freqData$parent))
    #freqData$parent <- freqData$parent - mean(freqData$parent)

    g <- ggplot(filter(freqData, freq > 0), 
                aes(x = parent, y = child))
    g <- g  + scale_size(range = c(2, 10), 
                         guide = "none" )
    g <- g + geom_point(aes(colour=freq, 
                            size = freq))
    g <- g + scale_colour_gradient(low = "salmon",
                                   high="white")  
    g <- g + ggtitle("Parents-Children Height Frequency")

    g <- g + geom_smooth(method = 'lm', formula = y~x)
    g

![](Notes1_files/figure-markdown_strict/unnamed-chunk-12-1.png)

# Module 3: Regression to the Mean

-   Regression to the mean was introduced by Francis Galton in the paper
    *Regression towards mediocrity in hereditary stature*, 1886.

-   Imagine if you simulated pairs of random normals

    -   The largest first ones would be the largest by chance and the
        probability that there are for the second simulation is high
    -   In other words, P(*Y*&lt;*x*∣*X*=*x*) gets bigger as *x* heads
        into the very large values.
    -   Similarly, P(*Y*&gt;*x*∣*X*=*x*) gets bigger as *x* heds to very
        small values

-   Think of the regression line as the intrisic part

    -   Unless Cor\[*X*,*Y*\] = 1, the intrinsic part is not perfect.

-   Suppose that we normalize *X* (child’s height) and *Y* (parent’s
    height) so that they both have mean 0 and variance 1.

-   Then, recall, our regression line passes through (0,0) (the mean of
    the *X* and *Y* respectively).

-   The slope of the regression line is Cor\[*X*,*Y*\], regardless of
    which variable is the outcome.

-   If *X* is the outcome and you create a plot where *X* is the
    horizontal axis, the slope of the least squares line that you plot
    is 1/Cor\[*X*,*Y*\]

<!-- -->

    x <- (father.son$sheight - mean(father.son$sheight))/sd(father.son$sheight)
    y <- (father.son$fheight - mean(father.son$fheight))/sd(father.son$fheight)

    rho <- cor(x, y)

    g <- ggplot(data.frame(x = x, y = y), 
                aes(x = x, y = y))
    g <- g + geom_point(size = 6, color = 'black', alpha = 0.2)
    g <- g + geom_point(size = 4, color = 'salmon', alpha = 0.2)
    #g <- g + xlim(-4, 4) + ylim(-4, 4)
    g <- g + geom_abline(intercept = 0, slope = 1)
    g <- g + geom_vline(xintercept = 0)
    g <- g + geom_hline(yintercept = 0)
    g <- g + geom_abline(yintercept = 0, slope = rho, size = 2)

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.

    ## Warning in geom_abline(yintercept = 0, slope = rho, size = 2): Ignoring unknown
    ## parameters: `yintercept`

    g <- g + geom_abline(yintercept = 0, slope = 1/rho, size = 2)

    ## Warning in geom_abline(yintercept = 0, slope = 1/rho, size = 2): Ignoring
    ## unknown parameters: `yintercept`

    g

![](Notes1_files/figure-markdown_strict/unnamed-chunk-13-1.png)
