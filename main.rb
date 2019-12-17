# require './drink'
# require './deposit'
require './vending'

class Main
end

@vending = Vending.new

# 飲み物の初期登録
## Array形式のデータ
drink_params = [{num: 1, name: "お茶", price: 120}, {num: 2, name: "オレンジジュース", price: 150}, {num: 3, name: "アップルジュース", price: 200}]
## Hash形式のデータ
# drink_params = {num: 1, name: "お茶", price: 120}
# 登録
@vending.add_drinks(drink_params)

# 飲み物一覧の出力
@vending.display_drinks

# 入金の依頼
@vending.deposits

# 購入商品の選択依頼
@vending.orders

# 会計
@vending.calculate