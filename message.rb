module VendingMessage

    def puts_message_request_deposit()
        print "入金してください。\r\n>>"
    end

    def puts_message_request_order()
        print "どのドリンクを購入しますか？番号で選択してください。\r\n>>"
    end

    def puts_message_not_number
        puts "数値以外の入力となっているようです。"
    end

    def puts_message_not_exist_drinks()
        puts "選択したドリンクは存在しません。"
    end

    def puts_message_failure_purchase()
        puts "入力金額が不足しているため、購入できません。"
    end

    def puts_message_success_purchase()
        puts "購入完了です！"
    end

    def puts_message_display_drinks(drinks)
        text = "ドリンクの一覧を表示します。\n"
        text += "--------------------------\n"
        drinks.each {|drink| text += " #{drink.id}：#{drink.name}（#{drink.price}円）\n" }
        text += "--------------------------\n"

        puts text
    end

    def puts_message_success_deposit(num)
        puts "#{num}円が投入されました！"
    end

    def puts_message_change(num)
        puts "おつりは#{num}円です。"
    end

    def puts_message_not_enough(num)
        puts "#{num}円の不足です。"
    end

    def puts_message_detail_order(drink)
        puts "#{drink.id}番のドリンク「#{drink.name}(#{drink.price}円)」を選択しました！"
    end

    def puts_message_line()
      puts "-" * 20
    end

end
