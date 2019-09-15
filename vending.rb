require './drink'
require './message'

class Vending
    include VendingMessage
    attr_reader :order

    # 入金
    def deposits
        putsSingleMessage("RequestDeposits")
        input = gets.chomp
        depo = Deposit.new(input)
        if chk_number?(depo.input_num)
            putsDoubleMessage("SuccessOfDeposit",depo.input_num)
        else
            deposits
        end
        depo.input_num
    end

    # 商品選択
    def orders(drinks)
        missOrder = true
        while missOrder do
            putsSingleMessage("RequestOrders")
            @order = gets.chomp
            next unless chk_number?(@order)

            @order = @order.to_i
            next unless chk_stock?(@order,drinks)

            missOrder = false
        end
    end

    # 数値チェック
    def chk_number?(num)
        # 先頭(\A)から末尾(\z)までが0~9であるか判定
        # @isNumber != (num =~ /\A[0-9]+\z/)
        if (num =~ /\A[0-9]+\z/)
            true
        else
            putsSingleMessage("CautionOfNumber")
            false
        end
    end

    # 在庫チェック
    def chk_stock?(num,drinks)
        returnFlg = false
        drinks.each do |d|
            if d[0]==num
                putsQuadrupleMessage("DetailOfOrder",d[0], d[1], d[2])
                returnFlg = true
                break
            end
        end
        putsSingleMessage("CautionOfStock") unless returnFlg
        returnFlg
    end

    # 計算
    def calculate(inputDepo,drinkPrice)
        inputDepo = inputDepo.to_i
        drinkPrice = drinkPrice.to_i
        absNumber = (inputDepo - drinkPrice).abs
        if inputDepo > drinkPrice
            putsSingleMessage("SuccessOfPurchase")
            putsDoubleMessage("Change",absNumber)
        else
            putsSingleMessage("FailureOfPurchase")
            putsDoubleMessage("NotEnough",absNumber)
        end
    end

    # 飲み物登録
    def addDrinks(drinkList)
        @drinks = []
        drinkList.each do |list|
            drink = Drink.new(list[:num],list[:name],list[:price])
            @drinks.push(drink.array_drink)
        end
        @drinks
    end

    # 飲み物一覧表示
    def displayDrinks
        putsSingleMessage("DisplayOfDrinks")
        @drinks.each do |drink|
            puts " #{drink[0]}：#{drink[1]}（#{drink[2]}円）"
        end
        puts "----------"
    end

end