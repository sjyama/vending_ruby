module VendingMessage
    def putsSingleMessage(msg)
        case msg
        when "RequestDeposits"
            print "入金してください。\r\n>>"
        when "RequestOrders"
            print "どのドリンクを購入しますか？番号で選択してください。\r\n>>"
        when "CautionOfNumber"
            puts "数値以外の入力となっているようです。"
        when "CautionOfStock"
            puts "選択したドリンクは存在しません。"

        when "FailureOfPurchase"
            puts "購入できません。"

        when "SuccessOfPurchase"
            puts "購入完了です！"

        when "DisplayOfDrinks"
            puts "ドリンクの一覧を表示します。"
        end
    end

    def putsDoubleMessage(msg,num)
        case msg
        when "SuccessOfDeposit"
            puts "#{num}円が投入されました！"

        when "Change"
            puts "おつりは#{num}円です。"

        when "NotEnough"
            puts "#{num}円の不足です。"
        end
    end

    def putsQuadrupleMessage(msg,num1,num2,num3)
        case msg
        when "DetailOfOrder"
            puts "#{num1}番のドリンク「#{num2}(#{num3}円)」を選択しました！"
        end
    end

end