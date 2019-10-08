module VendingMessage

    def puts_message_request_deposit()
        print "入金してください。\r\n>>"
    end

    def puts_message_request_order()
        print "どのドリンクを購入しますか？番号で選択してください。\r\n>>"
    end

    def puts_message_not_number()
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

    def puts_message_display_drinks()
        puts "ドリンクの一覧を表示します。"
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

    def puts_message_detail_order(num1,num2,num3)
        puts "#{num1}番のドリンク「#{num2}(#{num3}円)」を選択しました！"
    end

    def puts_message_line()
        puts "----------"
    end

end