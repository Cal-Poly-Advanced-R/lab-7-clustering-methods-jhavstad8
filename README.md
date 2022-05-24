
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clust431

<!-- badges: start -->
<!-- badges: end -->

The goal of clust431 is to implement basic k_means and hierarchical
agglomerative clustering on datasets.

## Installation

You can install the released version of clust431 from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("clust431")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(clust431)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
iris2 <- iris %>% select(Sepal.Length,Sepal.Width)
k_means(iris2,3)
#> X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 
#>  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3 
#> X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 
#>  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3 
#> X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 
#>  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3 
#> X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 
#>  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3 
#> X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 
#>  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3 
#> X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 X3 
#>  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3
hier_clust(iris2,3)
#> [1]  1 18
```
