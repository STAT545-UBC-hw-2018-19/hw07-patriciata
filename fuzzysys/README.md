<!-- README.md is generated from README.Rmd. Please edit that file -->
fuzzysys: Simple Fuzzy Inference and Fuzzy Systems
==================================================

The goal of fuzzysys is to provide a wrapper for fuzzy set functions from the package ['sets'](https://cran.r-project.org/web/packages/sets/index.html).

fuzzysys re-imagines fuzzy set and inference functions from the original `sets` package by David Meyer et al.<sup>[1](#citation)</sup>, with added customizability and control. It aims to be highly customizable for a variety of needs, without the clutter that comes with more hefty packages.

So far, it includes the basic fuzzy logic operators: negation ("NOT"), conjunction ("AND"), and disjunction ("OR"). These act as non-dynamic wrapper functions for functions in sets::fuzzy\_logic().

Example
-------

Fuzzy logic operators can be defined slightly differently depending on which fuzzy logic family or convention one chooses to use. (For example, the conjunction, or "AND" operator, is often defined as the minimum of two values (). However, with an alternative fuzzy logic family, it is could instead be defined as *x* \* *y*.)

With the `sets` package, to conduct fuzzy logic operations between membership values of fuzzy sets, you would normally have to stick to one so-called fuzzy logic family.

To illustrate, here is an example from `sets`.

Here we use the (dynamic) functions from the `sets` package: .N.(), .T.(), and .S.() for negation, conjunction, and disjunction respectively:

``` r
library(sets)

x <- c(0.7, 0.8, 0.9)
y <- c(0.2, 0.3, 0.4)

sets::fuzzy_logic("Zadeh") # specifies fuzzy logic family as "Zadeh"
sets::.N.(x)
#> [1] 0.3 0.2 0.1
sets::.T.(x, y)
#> [1] 0.2 0.3 0.4
sets::.S.(x, y)
#> [1] 0.7 0.8 0.9
```

To switch families, one would have to change the default/ current settings, like so:

``` r
sets::fuzzy_logic("product") # switch fuzzy logic family
sets::.N.(x)
#> [1] 0.3 0.2 0.1
sets::.T.(x, y)
#> [1] 0.14 0.24 0.36
sets::.S.(x, y)
#> [1] 0.76 0.86 0.94
```

The wrapper functions defined in this new `fuzzysys` package allow you to specify which family/ type of operator you want to use more concretely, without having to define one single fuzzy logic family.

For example, you can use different versions of the conjunction operator (specified by an argument to.T()) one line after another:

``` r
library(fuzzysys)

.T(x,y,type="Zadeh")
#> [1] 0.2 0.3 0.4
.T(x,y,type="product")
#> [1] 0.14 0.24 0.36
.T(x,y,type="Fodor")
#> [1] 0.0 0.3 0.4
```

Similarly, for the disjunction operator:

``` r
.S(x,y,type="Zadeh")
#> [1] 0.7 0.8 0.9
.S(x,y,type="product")
#> [1] 0.76 0.86 0.94
.S(x,y,type="Fodor")
#> [1] 0.7 1.0 1.0
```

And the negation operator (.N.()), which in most fuzzy logic families is defined as 1 − *x*.

``` r
x
#> [1] 0.7 0.8 0.9
.N(x,type="Zadeh")
#> [1] 0.3 0.2 0.1
.N(x,type="product")
#> [1] 0.3 0.2 0.1
.N(x,type="Fodor")
#> [1] 0.3 0.2 0.1
```

More information about each fuzzy logic family and their respective operator definitions can be found in the original `sets` [documentation](https://www.rdocumentation.org/packages/sets/versions/1.0-18/topics/fuzzy).

<a name="citation">1</a>: Meyer D and Hornik K (2009). “Generalized and Customizable Sets in R.” Journal of Statistical Software, 31(2), pp. 1–27. doi: [10.18637/jss.v031.i02](https://www.jstatsoft.org/article/view/v031i02).
