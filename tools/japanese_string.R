loc <- Sys.getlocale("LC_CTYPE")
Sys.setlocale("LC_CTYPE", "Japanese")

kan2roman <- enc2utf8("１２３４５６７８９０一二三四五六七八九〇壱壹弌弐貳弍参參弎肆伍陸漆柒質捌玖零")
kan1000 <- enc2utf8("千阡仟")
kan100 <- enc2utf8("百佰陌")
kan40 <- enc2utf8("卌")
kan30 <- enc2utf8("卅丗")
kan20 <- enc2utf8("廿卄")
kan10 <- enc2utf8("十拾")

kangannen <- enc2utf8("元年")
kannen <- enc2utf8("年")
kanmeiji <- enc2utf8("明治")
kanmei <- enc2utf8("明")
kantaisyo <- enc2utf8("大正")
kantai <- enc2utf8("大")
kansyowa <- enc2utf8("昭和")
kansyo <- enc2utf8("昭")
kanheisei <- enc2utf8("平成")
kanhei <- enc2utf8("平")
kanreiwa <- enc2utf8("令和")
kanrei <- enc2utf8("令")

usethis::use_data(kan2roman, kan1000, kan100, kan40, kan30, kan20, kan10,
                  kangannen, kannen,
                  kanmeiji, kanmei, kantaisyo, kantai, kansyowa, kansyo,
                  kanheisei, kanhei, kanreiwa, kanrei,
                  internal = TRUE, overwrite = TRUE)

Sys.setlocale("LC_CTYPE", "C")
