require './drink'
require './deposit'
require './vending'

class Main
end


# 飲み物の登録
@drinks = []
@drinks.push(Drink.new(1,"お茶",120).array_drink)
@drinks.push(Drink.new(2,"オレンジジュース",150).array_drink)
@drinks.push(Drink.new(3,"アップルジュース",200).array_drink)


# ドリンク一覧の出力
puts "ドリンクの一覧を表示します。"
@drinks.each do |drink|
    puts " #{drink[0]}：#{drink[1]}（#{drink[2]}円）"
end


puts "----------"
# 入金の依頼
@vending = Vending.new
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
