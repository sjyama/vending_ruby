require './drink'

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
        missOrder = true
        while missOrder do
            puts "どのドリンクを購入しますか？番号で選択してください。"
            print ">>"
            @order = gets.chomp
            next unless chk_number?(@order)

            @order = @order.to_i
            next unless chk_stock?(@order,drinks)

            missOrder = false
        end
    end

    def chk_number?(num)
        # 先頭(\A)から末尾(\z)までが0~9であるか判定
        # @isNumber != (num =~ /\A[0-9]+\z/)
        if (num =~ /\A[0-9]+\z/)
            true
        else
            puts "数値以外の入力となっているようです。"
            false
        end
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
        puts "選択したドリンクは存在しません。" unless returnFlg
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

    def addDrinks(drinkList)
        @drinks = []
        drinkList.each do |list|
            drink = Drink.new(list[:num],list[:name],list[:price])
            @drinks.push(drink.array_drink)
        end
        @drinks
    end

    def displayDrinks
        puts "ドリンクの一覧を表示します。"
        @drinks.each do |drink|
            puts " #{drink[0]}：#{drink[1]}（#{drink[2]}円）"
        end
        puts "----------"
    end

end