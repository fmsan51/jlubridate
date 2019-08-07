test_that("kansuji2roman", {
  expect_equal(kansuji2roman("一二三四年五月六日"), "1234年5月6日")
  expect_equal(
    kansuji2roman("九千八百七十六", "九千八十七", "九千八", "九千"),
    c("9876", "9087", "9008", "9000"))
  expect_equal(kansuji2roman("五百四", "五百"), c("504", "500"))
  expect_equal(kansuji2roman("三十"), "30")
})
