test_that("jymd", {
  expect_equal(jymd(c("明治元年9月8日", "大1.7.30")),
               ymd(c("1868年9月8日", "1912.7.30"), tz = "Asia/Tokyo"))
})

test_that("jymd_h", {
  expect_equal(jymd_h("S1/12/25 7AM"),
               ymd_h("1926/12/25 7AM", tz = "Asia/Tokyo"))
})

test_that("jymd_hm", {
  expect_equal(jymd_hm("Heisei 1-1-8 12:00"),
               ymd_hm("1989-1-8 12:00", tz = "Asia/Tokyo"))
})

test_that("jymd_hm", {
  expect_equal(jymd_hms("REIWA 1年 5月 1日 12時00分00秒"),
               ymd_hms("2019 May 1 12:00:00", tz = "Asia/Tokyo"))
})
