# 必要なライブラリを読み込む
library(socialranking)
library(gtools)

# 元の要素のリスト
elements <- list(c(1, 2, 3), c(1, 2), c(1, 3), c(2), c(2, 3), c(1), c(3))

# インデックスの順列を生成
index_permutations <- permutations(n = length(elements), r = length(elements), v = seq_along(elements))

# 部分集合のリストの順列を格納するリストを初期化
all_permutations <- list()

# 各インデックスの順列を適用して部分集合のリストを並べ替える
for (i in 1:nrow(index_permutations)) {
  # 現在のインデックスの順列に従って部分集合のリストを並べ替える
  reordered_elements <- elements[index_permutations[i, ]]
  all_permutations <- append(all_permutations, list(reordered_elements))
}

while (sink.number() > 0) {
  sink()
}
# 出力をファイルにリダイレクト
sink("/Users/tamr/CMIS/code/socialranking/output/copelandranking.txt")

# 比較子の全ての組み合わせを生成
comparators1 <- expand.grid(c("~", ">"), c("~", ">"), c("~", ">"), c("~", ">"), c("~", ">"), c("~", ">"), c("~", ">"))

# 全てのパターンを作成し、as.PowerRelationを呼び出す
power_relations <- list()
for (i in seq_along(all_permutations)) {
  for (j in 1:nrow(comparators1)) {
    a = c(as.character(comparators1[j, 1]), as.character(comparators1[j, 2]), as.character(comparators1[j, 3]), as.character(comparators1[j, 4]), as.character(comparators1[j, 5]), as.character(comparators1[j, 6]), as.character(comparators1[j, 7]))
    pr <- as.PowerRelation(
      all_permutations[[i]],
      comparators = c(as.character(comparators1[j, 1]), as.character(comparators1[j, 2]), as.character(comparators1[j, 3]), as.character(comparators1[j, 4]), as.character(comparators1[j, 5]), as.character(comparators1[j, 6]), as.character(comparators1[j, 7]))
    )
    #print(all_permutations[[i]])
    print(pr)
    print(copelandRanking(pr))
  }
}

# 出力を元に戻す
sink()