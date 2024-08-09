# socialranking パッケージのロード
library(socialranking)

pr <- as.PowerRelation("
  123
  > 12
  ~ 13
  > 2
  ~ 23
  > 1
  > 3
")

# PowerRelation オブジェクトの作成
print(pr)
print(copelandRanking(pr))