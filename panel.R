# source("panel.R",echo = TRUE)とかで実行
library(plm)

# plmパッケージに付属するGrunfeldデータの読み込み
# アメリカの有名企業に関するパネルデータ
# firm:企業番号,year:西暦,inv:総投資,value:企業価値,capital:有形固定資産
data("Grunfeld",package="plm")

# もしcsvで読み込みたいなら以下コメントアウトを外す
# どっちみちGrunfeldの内容は同じになります
# Grunfeld <= read.csv("panel.csv")

# データの最初の25行をみる
head(Grunfeld,25)


# 以下モデルを推定する
# inv_it = α_i + β_1value_it + β2capital_it +ε_it
# model="pooling"はPooled OLSで推定
# 引数は(モデルの式、データ、モデル形式)
result1=plm(inv~value+capital,data=Grunfeld,model="pooling")

summary(result1)

result2=plm(inv~value+capital,data=Grunfeld,model="within")
summary(result2)