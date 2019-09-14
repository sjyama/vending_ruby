require './drink'
require './deposit'
require './vending'

class Main
end

@vending = Vending.new

# 飲み物の登録
@drinks = @vending.addDrinks([{num: 1, name: "お茶", price: 120}, {num: 2, name: "オレンジジュース", price: 150}, {num: 3, name: "アップルジュース", price: 200}])

# ドリンク一覧の出力
@vending.displayDrinks

# 入金の依頼
inputDeposit = @vending.deposits

puts "----------"
# 購入商品の選択依頼
@vending.orders(@drinks)

puts "----------"
@vending.calculate(inputDeposit,@drinks[@vending.order-1][2])
