#' Convert kansuji to Roman numbers
#'
#' Converts kansuji or zenkaku numbers to Roman numbers. Applicable only for kansuji that means an integer from 0 to 9999. Letters that don't mean numbers (including commas as decimal separators) are ignored.
#'
#' @param x kansuji to convert
#' @export
kansuji2roman <- function(x) {
  x <- chartr(kan2roman, "12345678901234567890111222333456777890", x)
  pat1000 <- paste0("[", kan1000, "]")
  pat100 <- paste0("[", kan100, "]")
  pat40 <- paste0("[", kan40, "]")
  pat30 <- paste0("[", kan30, "]")
  pat20 <- paste0("[", kan20, "]")
  pat10 <- paste0("[", kan10, "]")
  num100aft <- paste0("(?=\\d?", pat100, ")")
  num10aft <- paste0("(?=(?:\\d?", pat10, "|[", kan20, kan30, kan40, "]))")
  num_bef <- "(?<=\\d)"
  no_num_bef <- "(?<!\\d)"
  num_aft <- "(?=\\d)"
  no_num_aft <- "(?!\\d)"
  x <- gsub(paste0(num_bef, pat1000, num100aft), "", x, perl = T)  # 2100
  x <- gsub(paste0(no_num_bef, pat1000, num100aft), "1", x, perl = T)  # 1100
  x <- gsub(paste0(num_bef, pat1000, num10aft), "0", x, perl = T)  # 2010
  x <- gsub(paste0(no_num_bef, pat1000, num10aft), "10", x, perl = T)  # 1010
  x <- gsub(paste0(num_bef, pat1000, num_aft), "00", x, perl = T)  # 2001
  x <- gsub(paste0(no_num_bef, pat1000, num_aft), "100", x, perl = T)  # 1001
  x <- gsub(paste0(num_bef, pat1000, no_num_aft), "000", x, perl = T)  # 2000
  x <- gsub(paste0(no_num_bef, pat1000, no_num_aft), "1000", x, perl = T)  # 1000
  x <- gsub(paste0(num_bef, pat100, num10aft), "", x, perl = T)  # 210
  x <- gsub(paste0(no_num_bef, pat100, num10aft), "1", x, perl = T)  # 110
  x <- gsub(paste0(num_bef, pat100, num_aft), "0", x, perl = T)  # 201
  x <- gsub(paste0(no_num_bef, pat100, num_aft), "10", x, perl = T)  # 101
  x <- gsub(paste0(num_bef, pat100, no_num_aft), "00", x, perl = T)  # 200
  x <- gsub(paste0(no_num_bef, pat100, no_num_aft), "100", x, perl = T)  # 100
  x <- gsub(paste0(num_bef, pat10, num_aft), "", x, perl = T)  # 21
  x <- gsub(paste0(no_num_bef, pat10, num_aft), "1", x, perl = T)  # 11
  x <- gsub(paste0(pat20, num_aft), "2", x, perl = T)
  x <- gsub(paste0(pat30, num_aft), "3", x, perl = T)
  x <- gsub(paste0(pat40, num_aft), "4", x, perl = T)
  x <- gsub(paste0(num_bef, pat10, no_num_aft), "0", x, perl = T)  # 20
  x <- gsub(paste0(no_num_bef, pat10, no_num_aft), "10", x, perl = T)  # 10
  x <- gsub(paste0(pat20, no_num_aft), "20", x, perl = T)
  x <- gsub(paste0(pat30, no_num_aft), "30", x, perl = T)
  x <- gsub(paste0(pat40, no_num_aft), "40", x, perl = T)
  return(x)
}
