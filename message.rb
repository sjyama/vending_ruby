module Message

    def puts_message_request_deposit
        print "入金してください。\r\n>>"
    end

    def puts_message_request_order
        print "どのドリンクを購入しますか？番号で選択してください。\r\n>>"
    end

    def puts_message_not_number
        puts "数値以外の入力となっているようです。"
    end

    def puts_message_not_exist_drinks
        puts "選択したドリンクは存在しません。"
    end

    def puts_message_failure_purchase(money)
        puts <<~EOS
        入力金額が不足しているため、購入できません。
        #{money}円の不足です。
        EOS
    end

    def puts_message_success_purchase(money)
        puts <<~EOS
        購入完了です！
        おつりは#{money}円です。
        EOS
    end

    def puts_message_display_drinks
        puts "ドリンクの一覧を表示します。"
    end

    def puts_message_success_deposit(num)
        puts "#{num}円が投入されました！"
    end

    def puts_message_total_deposit(num)
        puts "入金額の合計は#{num}円になりました。"
    end

    def puts_message_detail_order(drink)
        puts "#{drink.num}番のドリンク「#{drink.name}(#{drink.price}円)」を選択しました！"
    end

    def puts_message_line
        puts "----------"
    end

end