skip_on_cran()

test_that("gengo2seireki", {
  expect_equal(gengo2seireki(c("明治元年9月8日", "M45.7.30")),
                             c("1868年9月8日", "1912.7.30"))
  expect_equal(gengo2seireki(c("大正元年7月30日", "T15.12.25")),
                             c("1912年7月30日", "1926.12.25"))
  expect_equal(gengo2seireki(c("昭和元年12月25日", "S64.1.7")),
                             c("1926年12月25日", "1989.1.7"))
  expect_equal(gengo2seireki(c("平成元年1月8日", "H31.4.30")),
                             c("1989年1月8日", "2019.4.30"))
  expect_equal(gengo2seireki("令和元年5月1日"), "2019年5月1日")
})
