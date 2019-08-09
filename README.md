
<!-- README.md is generated from README.Rmd. Please edit that file -->
jlubridate
==========

<!-- badges: start -->
<!-- badges: end -->
jlublidate provides wrappers of `ymd()` series from [lubridate package](https://cran.r-project.org/package=lubridate) to parse Japanese gengo (元号) (or nengo (年号)).

Installation
------------

<!---
You can install the released version of jlubridate from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("jlubridate")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fmsan51/jlubridate")
```
--->
You can install jlubridate from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fmsan51/jlubridate")
```

Example
-------

`jymd()`: recognize date written in 元号 and convert it to `POSIXct` class object in 西暦.

``` r
library(jlubridate)

jymd("昭和元年十二月二十五日", "平１０．３．２８", "R 4-3-1", "二〇一九年八月七日")  # 元号 dates can be mixed with 西暦 dates.
#> Warning: 3 failed to parse.
#> [1] NA               NA               "2022-03-01 JST" NA
```

元号 of 明治, 大正, 昭和, 平成, and 令和 can be recognized.
Formats which can be recognized are follows: 令和, 令, R, r, Reiwa, reiwa, REIWA.
`jymd()`, `jymd_h()`, `jymd_hm()`, and `jymd_hms()` correspond to `ymd()`, `ymd_h()`, `ymd_hm()` and `ymd_hms()` respectively.

### Extras

`gengo2seireki()`: convert 元号 dates to 西暦 dates.

``` r
gengo2seireki("明治一二年三月四日")
#> [1] "<U+660E><U+6CBB><U+4E00><U+4E8C><U+5E74><U+4E09><U+6708><U+56DB><U+65E5>"
```

`kansuji2roman()`: convert numbers written in Chinese characters (漢数字) to Roman numbers. Applicable only for integers from 0 to 9999.

``` r
kansuji2roman("千二百三十四")
#> [1] "<U+5343><U+4E8C><U+767E><U+4E09><U+5341><U+56DB>"
```
