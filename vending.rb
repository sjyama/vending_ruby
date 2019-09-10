class Vending
    attr_reader :order
    
    def deposits
        puts "入金してください。"
        print ">>"
        input = gets.chomp
        depo = Deposit.new(input)
        if chk_number?(depo.input_num)
            puts "#{depo.input_num}円が投入されました！"
        else
            puts "入金は数値でお願いします。"
            print "改めて、"
            deposits
        end
        depo.input_num
    end

    def orders(drinks)
        puts "どのドリンクを購入しますか？番号で選択してください。"
        print ">>"
        @order = gets.chomp
        if chk_number?(@order)
            @order = @order.to_i
            if chk_stock?(@order,drinks)
                true
            else
                puts "選択されたドリンク番号は存在しません。"
                false
            end
        else
            puts "ドリンク選択は番号でお願いします。"
            false
        end
    end

    def chk_number?(num)
        # 先頭(\A)から末尾(\z)までが0~9であるか判定
        @isNumber != (num =~ /\A[0-9]+\z/)
    end

    def chk_stock?(num,drinks)
        returnFlg = false
        drinks.each do |d|
            if d[0]==num
                puts "#{drinks[num-1][0]}番のドリンク「#{drinks[num-1][1]}(#{drinks[num-1][2]}円)」を選択しました！"
                returnFlg = true
                break
            end
        end
        returnFlg
    end

    def calculate(inputDepo,drinkPrice)
        inputDepo = inputDepo.to_i
        drinkPrice = drinkPrice.to_i
        absNumber = (inputDepo - drinkPrice).abs
        if inputDepo > drinkPrice
            puts "購入完了です！"
            puts "おつりは#{absNumber}円です。"
        else
            puts "購入できません。"
            puts "#{absNumber}円の不足です。"
        end

    end
end