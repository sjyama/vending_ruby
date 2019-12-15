module VendingMessage
  def drink_info_message(drinks, deposited_money)
    if drinks.empty?
      puts "ドリンクがありません"
    else
      text = "ドリンクの一覧を表示します。\n"
      text += "--------------------------\n"
      drinks.each do |drink|
        available = deposited_money >= drink.price ? "○" : "×"
        text += " #{drink.id}：#{drink.name}（#{drink.price}円）購入 #{available}\n"
      end
      text += "--------------------------\n"

      puts text
    end
  end

  def request_deposit_message
      print "入金してください。\r\n>>"
  end

  def request_order_message
      print "どのドリンクを購入しますか？番号で選択してください。\r\n>>"
  end

  def not_number_message
      puts "数値以外の入力となっているようです。"
  end

  def not_exist_drinks_message
      puts "選択したドリンクは存在しません。"
  end

  def failure_purchase_message(money)
      puts <<~EOS
      入力金額が不足しているため、購入できません。
      #{money}円の不足です。
      EOS
  end

  def success_purchase_message(money)
      puts <<~EOS
      購入完了です！
      おつりは#{money}円です。
      EOS
  end

  def success_deposit_message(inputed_money, deposited_money)
      puts "#{inputed_money}円が投入されました！ 合計投入金額：#{deposited_money}円"
  end

  def detail_order_message(drink)
      puts "#{drink.id}番のドリンク「#{drink.name}(#{drink.price}円)」を選択しました！"
  end
end
