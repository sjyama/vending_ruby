require './drink'
require './deposit'
require './vending'
require './message'

class Main
end

@vending = Vending.new

# 飲み物の初期登録
## Array形式のデータ
@drinks = @vending.add_drinks([{num: 1, name: "お茶", price: 120}, {num: 2, name: "オレンジジュース", price: 150}, {num: 3, name: "アップルジュース", price: 200}])
## Hash形式のデータ
# @drinks = @vending.add_drinks({num: 1, name: "お茶", price: 120})

# 飲み物一覧の出力
@vending.display_drinks

# 入金の依頼
input_deposit = @vending.deposits

# 購入商品の選択依頼
@vending.orders(@drinks)

# 会計
@vending.calculate(input_deposit, @vending.selected_drink.price)