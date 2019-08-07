
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jlubridate

<!-- badges: start -->

<!-- badges: end -->

jlublidate provides a wrapper of `ymd()` from [lubridate
package](https://cran.r-project.org/package=lubridate) to parse Japanese
gengo (元号) (or nengo (年号)).

## Installation

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

## Example

`jymd`: recognize date written in 元号 and convert it to `POSIXct` class
object in 西暦.

``` r
library(jlubridate)

jymd("昭和元年12月25日", "平10.3.28", "R 4-3-1", "2018年8月7日")  # 元号 dates can be mixed with 西暦 dates
#> [1] "1926-12-25 JST" "1998-03-28 JST" "2022-03-01 JST" "2018-08-07 JST"
```

元号 of 明治, 大正, 昭和, 平成, and 令和 can be recognized.  
Formats which can be recognized are follows: 令和, 令, R, r, Reiwa, reiwa,
REIWA.  
`jymd`, `jymd_h`, `jymd_hm`, and `jymd_hms` correspond to `ymd`,
`ymd_h`, `ymd_hm` and `ymd_hms` respectively.

### Extras

`gengo2seireki`: convert 元号 dates to 西暦 dates.

``` r
gengo2seireki("明治一二年三月四日")
#> [1] "1879年3月4日"
```

`kansuji2roman`: convert numbers written in Chinese characters (漢数字) to
Roman numbers. Applicable only for integers from 0 to 9999.

``` r
kansuji2roman("千二百三十四")
#> [1] "1234"
```
