#' Translate year in gengo into year in seireki
#'
#' Translate year in gengo into year in seireki. Meiji, Taisyo, Syowa, Heisei, and Reiwa can be recognized.
#'
#' @param x string which indicates date.
#' @examples
#' gengo2seireki("H31.4.30")
#' @importFrom dplyr case_when coalesce
#' @importFrom stringr str_extract str_match str_replace
#' @export
gengo2seireki <- function(x) {
  x <- sub(kangannen, paste0("1", kannen), x)
  x <- kansuji2roman(x)

  gengo <- c("meiji", "taisyo", "syowa", "heisei", "reiwa")

  patterns <- paste0("(?:\\W|^)(?:[",
                     c(kanmei, kantai, kansyo, kanhei, kanrei),
                     c("Mm", "Tt", "Ss", "Hh", "Rr"),
                     "]|",
                     c(kanmeiji, kantaisyo, kansyowa, kanheisei, kanreiwa),
                     "|",
                     c("[Mm]eiji|MEIJI", "[Tt]ais[hy]o|TAIS[HY]O",
                       "[Ss][hy]owa|S[HY]OWA", "[Hh]eisei|HEISEI",
                       "[Rr]eiwa|REIWA"),
                     ")\\W*(\\d{1,2}\\D.+$)")

  matched_mat <- matrix(nrow = length(x), ncol = length(gengo))
  for (i in seq_along(gengo)) {
    matched_mat[, i] <- str_match(x, patterns[i])[, 2]
  }
  duplication <- apply(matched_mat, 1, function(x) {sum(!is.na(x)) >= 2})
  if (any(duplication)) {
    warning(" ", sum(duplication), " failed to parse gengo.", .call = FALSE)
  }
  matched_mat[, duplication] <- NA
  col_matched <- rowSums(sweep(!is.na(matched_mat), 2, seq_along(gengo), "*"))
  col_matched[col_matched == 0] <- NA

  matched_gengo <- gengo[col_matched]
  str_wo_gengo <- coalesce(!!!as.data.frame(cbind(matched_mat, x)))
  str_wo_gengo[duplication] <- NA

  year <- as.numeric(str_extract(str_wo_gengo, "^\\d+"))
  year <- case_when(matched_gengo == "meiji" ~ year + 1867,
                    matched_gengo == "taisyo" ~ year + 1911,
                    matched_gengo == "syowa" ~ year + 1925,
                    matched_gengo == "heisei" ~ year + 1988,
                    matched_gengo == "reiwa" ~ year + 2018,
                    T ~ year)
  str_in_seireki <- str_replace(str_wo_gengo, "^\\d+", as.character(year))

  return(str_in_seireki)
}
