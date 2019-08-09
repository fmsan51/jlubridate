#' Parse dates with year in Japanese nengo, month, and day components
#'
#' An wrapper of [lubridate::ymd()] to enable paring Japanese gengo. Meiji, Taisyo, Syowa, Heisei, and Reiwa can be recognized.
#'
#' @note `tz` argument has default value as `"Asia/Tokyo"` unlike `NULL` in [lubridate::ymd()].
#'
#' @param tz Time zone indicator. If `NULL` a Date object is returned. Otherwise a POSIXct with time zone attribute set to tz.
#'
#' @inheritParams lubridate::ymd
#' @importFrom lubridate ymd ymd_h ymd_hm ymd_hms
#' @name jymd
#' @export
jymd <- function(..., quiet = FALSE, tz = "Asia/Tokyo",
                 locale = Sys.getlocale("LC_TIME"), truncated = 0){
  x <- rapply(list(...), as.character)
  x <- gengo2seireki(x)
  x <- ymd(x, quiet = quiet, tz = tz, locale = locale, truncated = truncated)
  return(x)
}


#' @name jymd
#' @export
jymd_h <- function(..., quiet = FALSE, tz = "Asia/Tokyo",
                   locale = Sys.getlocale("LC_TIME"), truncated = 0){
  x <- rapply(list(...), as.character)
  x <- gengo2seireki(x)
  x <- ymd_h(x, quiet = quiet, tz = tz, locale = locale, truncated = truncated)
  return(x)
}


#' @name jymd
#' @export
jymd_hm <- function(..., quiet = FALSE, tz = "Asia/Tokyo",
                    locale = Sys.getlocale("LC_TIME"), truncated = 0){
  x <- rapply(list(...), as.character)
  x <- gengo2seireki(x)
  x <- ymd_hm(x, quiet = quiet, tz = tz, locale = locale, truncated = truncated)
  return(x)
}


#' @name jymd
#' @export
jymd_hms <- function(..., quiet = FALSE, tz = "Asia/Tokyo",
                     locale = Sys.getlocale("LC_TIME"), truncated = 0){
  x <- rapply(list(...), as.character)
  x <- gengo2seireki(x)
  x <- ymd_hms(x, quiet = quiet, tz = tz, locale = locale,
               truncated = truncated)
  return(x)
}
