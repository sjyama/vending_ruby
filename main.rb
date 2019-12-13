require './deposit'
require './vending'
require './message'

class Main
end

@vending = Vending.new

drink_params = [{name: "お茶", price: 120}, {name: "オレンジジュース", price: 150}, {name: "アップルジュース", price: 200}]
# 飲み物の初期登録
## Array形式のデータ
@vending.add(drink_params)
## Hash形式のデータ
# @drinks = @vending.add_drinks({num: 1, name: "お茶", price: 120})

# 入金の依頼
@vending.deposits

# 飲み物一覧の出力
@vending.display_drinks

# 購入商品の選択依頼
@vending.orders

# 会計
@vending.calculate
