loc <- Sys.getlocale("LC_CTYPE")
Sys.setlocale("LC_CTYPE", "Japanese")

kan2roman <- enc2utf8("１２３４５６７８９０一二三四五六七八九〇壱壹弌弐貳弍参參弎肆伍陸漆柒質捌玖零")
kan1000 <- enc2utf8("千阡仟")
kan100 <- enc2utf8("百佰陌")
kan40 <- enc2utf8("卌")
kan30 <- enc2utf8("卅丗")
kan20 <- enc2utf8("廿卄")
kan10 <- enc2utf8("十拾")
usethis::use_data(kan2roman, kan1000, kan100, kan40, kan30, kan20, kan10,
                  internal = TRUE, overwrite = TRUE)

Sys.setlocale("LC_CTYPE", "C")
