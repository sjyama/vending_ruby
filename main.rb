require './drink'
require './deposit'
require './vending'

class Main
end

@vending = Vending.new

# 飲み物の登録
@drinks = @vending.add_drinks([{num: 1, name: "お茶", price: 120}, {num: 2, name: "オレンジジュース", price: 150}, {num: 3, name: "アップルジュース", price: 200}])

# ドリンク一覧の出力
@vending.display_drinks

# 入金の依頼
inputDeposit = @vending.deposits

puts "----------"
# 購入商品の選択依頼
missOrder = false
while !missOrder do
    if @vending.orders(@drinks)
        missOrder = true
    else
        missOrder = false
    end
end


puts "----------"
@vending.calculate(inputDeposit,@drinks[@vending.order-1][2])
