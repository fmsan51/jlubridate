#' Convert kansuji to Roman numbers
#'
#' Converts kansuji or zenkaku numbers to Roman numbers. Applicable only for kansuji that means an integer from 0 to 9999. Letters that don't mean numbers (including commas as decimal separators) are ignored.
#'
#' @param x kansuji to convert
#' @examples
#' kansuji2roman(c("一二三四年五月六日", "千二百三十四", "１２３４"))
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
  x <- gsub(paste0(num_bef, pat1000, num100aft), "", x, perl = T)  # 1千百
  x <- gsub(paste0(no_num_bef, pat1000, num100aft), "1", x, perl = T)  # 千百
  x <- gsub(paste0(num_bef, pat1000, num10aft), "0", x, perl = T)  # 1千十
  x <- gsub(paste0(no_num_bef, pat1000, num10aft), "10", x, perl = T)  # 千十
  x <- gsub(paste0(num_bef, pat1000, num_aft), "00", x, perl = T)  # 1千1
  x <- gsub(paste0(no_num_bef, pat1000, num_aft), "100", x, perl = T)  # 千1
  x <- gsub(paste0(num_bef, pat1000, no_num_aft), "000", x, perl = T)  # 1千
  x <- gsub(paste0(no_num_bef, pat1000, no_num_aft), "1000", x, perl = T)  # 千
  x <- gsub(paste0(num_bef, pat100, num10aft), "", x, perl = T)  # 1百十
  x <- gsub(paste0(no_num_bef, pat100, num10aft), "1", x, perl = T)  # 百十
  x <- gsub(paste0(num_bef, pat100, num_aft), "0", x, perl = T)  # 1百1
  x <- gsub(paste0(no_num_bef, pat100, num_aft), "10", x, perl = T)  # 百1
  x <- gsub(paste0(num_bef, pat100, no_num_aft), "00", x, perl = T)  # 1百
  x <- gsub(paste0(no_num_bef, pat100, no_num_aft), "100", x, perl = T)  # 百
  x <- gsub(paste0(num_bef, pat10, num_aft), "", x, perl = T)  # 1十1
  x <- gsub(paste0(no_num_bef, pat10, num_aft), "1", x, perl = T)  # 十1
  x <- gsub(paste0(pat20, num_aft), "2", x, perl = T)  # 廿1
  x <- gsub(paste0(pat30, num_aft), "3", x, perl = T)  # 卅1
  x <- gsub(paste0(pat40, num_aft), "4", x, perl = T)  # 卌1
  x <- gsub(paste0(num_bef, pat10, no_num_aft), "0", x, perl = T)  # 1十
  x <- gsub(paste0(no_num_bef, pat10, no_num_aft), "10", x, perl = T)  # 十
  x <- gsub(paste0(pat20, no_num_aft), "20", x, perl = T)  # 廿
  x <- gsub(paste0(pat30, no_num_aft), "30", x, perl = T)  # 卅
  x <- gsub(paste0(pat40, no_num_aft), "40", x, perl = T)  # 卌
  return(x)
}
