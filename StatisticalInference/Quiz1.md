

-   <a href="#question-1" id="toc-question-1">Question 1</a>
-   <a href="#answer-1" id="toc-answer-1">Answer 1</a>
-   <a href="#question-2" id="toc-question-2">Question 2</a>
-   <a href="#answer-2" id="toc-answer-2">Answer 2</a>
-   <a href="#question-3" id="toc-question-3">Question 3</a>
-   <a href="#answer-3" id="toc-answer-3">Answer 3</a>
-   <a href="#question-4" id="toc-question-4">Question 4</a>
-   <a href="#answer-4" id="toc-answer-4">Answer 4</a>
-   <a href="#question-5" id="toc-question-5">Question 5</a>
-   <a href="#answer-5" id="toc-answer-5">Answer 5</a>

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

## Question 1

Consider influenza epidemics for two parent heterosexual families.
Suppose that the probability is 17% that at least one of the parents has
contracted the disease. The probability that the father has contracted
influenza is 12% while the probability that both the mother and father
have contracted the disease is 6%. What is the probability that the
mother has contracted influenza?

## Answer 1

$$
\begin{align}
\text{the probability that at least one of the parents has contracted the disease is 17\\%: }&
\quad P(M \cup F) = 0.17 
\\\\
\text{the probability that the father has contracted influenza is 12\\%: }&
\quad P(F) = 0.12; 
\\\\
\text{the probability that both the mother and father have contracted the disease is 6\\%: }&
\quad P(M \cap F) = 0.06
\end{align}
$$

$$
\begin{align}
P(M \cup F) = P(M) + P(F) - P(M \cap F)
\Rightarrow
P(M) = P(M \cup F) - P(F) + P(M \cap F)
=
0.17 - 0.12 + 0.06
=
0.11
\end{align}
$$

## Question 2

A random variable, *X* is uniform, a box from 0 to 1 of height 1. (So
that its density is *f*(*x*) = 1 for 0 ≤ *x* ≤ 1). What is its
75<sup>*t**h*</sup> percentile?

## Answer 2

The Uniform distribution with parameters 0 and 1 is given by
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
The *a* quantile is obtained via `qunif(a, 0, 1)` (where 0 and 1
correspond to the Uniform parameters that are considered in this
question):

    q <- qunif(0.75,0,1)
    q

    ## [1] 0.75

The graph of the Uniform density with the area corresponding to 0.75
probability mass is:

    plot(seq(-0.5, 1.5, by = 0.001), 
         dunif(seq(-0.5, 1.5, by = 0.001), 0, 1), 
         type = 'l', lwd = 2,col = 'chocolate3',
         xlab = 'x', ylab = 'U(x|0,1)', 
         main = 'Uniform density')
    polygon(c(0,q,q,0),
            c(0,0,dunif(q,0,1),dunif(q,0,1)),
            density = 25, angle = 90, col = "chocolate3")

![](Quiz1_files/figure-markdown_strict/unnamed-chunk-2-1.png)

## Question 3

You are playing a game with a friend where you flip a coin and if it
comes up heads you give her  
*x* dollars and if it comes up tails she gives you *y* dollars. The
probability that the coin is heads is *p* (some number between 0 and 1).
What has to be true about *x* and *y* to make so that both of your
expected total earnings is 0. The game would then be called “fair”.

## Answer 3

The expected value is
$$
\mathbb{E}\left\[ \text{Player 1} \right\]
=
(-x) p + y (1-p)
=
0 
\Rightarrow
\frac{p}{(1-p)} = \frac{y}{x} 
\\\\ 
\mathbb{E}\left\[ \text{Player 2} \right\]
=
x p + (-y) (1-p)
=
0 
\Rightarrow
 \frac{p}{(1-p)} = \frac{y}{x}  
$$

## Question 4

A density that looks like a normal density (but may or may not be
exactly normal) is exactly symmetric about zero. (Symmetric means if you
flip it around zero it looks the same.) What is its median?

## Answer 4

In order for the density to be symmetric, it has to have the median
precisely at 0, in order to have the same probability mass when flipped.
Hence, the median is zero.

## Question 5

Consider the following PMF shown below in `R`

    x <- 1:4
    p <- x/sum(x)
    temp <- rbind(x, p)
    rownames(temp) <- c("X", "Prob")
    temp

    ##      [,1] [,2] [,3] [,4]
    ## X     1.0  2.0  3.0  4.0
    ## Prob  0.1  0.2  0.3  0.4

## Answer 5

What is the mean?

    sum(temp[1,] * temp[2,])

    ## [1] 3
