require './drink'
require './deposit'

class Main
	def deposits
		puts "入金してください。"
		input = gets.chomp
		depo = Deposit.new(input)
		if chk_number?(depo.input_num)
			puts "#{depo.input_num}円が投入されました！"
			true
		else
			puts "入金は数値でお願いします。"
			print "改めて、"
			deposits
		end
	end

	def chk_number?(num)
		# 先頭(\A)から末尾(\z)までが0~9であるか判定
		@isNumber != (num =~ /\A[0-9]+\z/)
	end
end


# 飲み物の登録
drinks = []
drinks.push(Drink.new(1,"お茶",120).array_drink)
drinks.push(Drink.new(2,"オレンジジュース",150).array_drink)
drinks.push(Drink.new(3,"アップルジュース",200).array_drink)

# ドリンク一覧の出力
puts "ドリンクの一覧を表示します。"
drinks.each do |drink|
	puts " #{drink[0]}：#{drink[1]}（#{drink[2]}円）"
end
puts "----------"

# 入金の依頼
vending = Main.new
chk = vending.deposits

# 購入商品の選択依頼
puts "----------"
puts "どのドリンクを購入しますか？番号で入力してください。"
order = gets.chomp
# chk_number?メソッドを使って、数値チェックを実装予定
puts "#{order}番のドリンクを選択しました！"

# ドリンクの値段と入金額の差し引き（計算・判定）
	# →OK：購入ありがとうございます！お釣りは〜〜円です。
	# →NG：入金が不足しています。入金or商品選択のやり直しを依頼？
