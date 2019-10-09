require './drink'
    require './message'

class Vending
    include VendingMessage
    attr_reader :order

    # 入金
    def deposits
        puts_message_request_deposit()
        input = gets.chomp
        depo  = Deposit.new(input)
        if chk_number?(depo.input_num)
            puts_message_success_deposit(depo.input_num)
        else
            deposits
        end
        depo.input_num
    end

    # 商品選択
    def orders(drinks)
        puts_message_line()
        missOrder = true
        while missOrder do
            puts_message_request_order()
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
            puts_message_not_number()
            false
        end
    end

    # 在庫チェック
    def chk_stock?(num,drinks)
        returnFlg = false
        drinks.each do |drink|
            if drink[0]==num
                puts_message_detail_order(drink)
                returnFlg = true
                break
            end
        end
        puts_message_not_exist_drinks() unless returnFlg
        returnFlg
    end

    # 計算
    def calculate(inputDepo,drinkPrice)
        puts_message_line()
        inputDepo  = inputDepo.to_i
        drinkPrice = drinkPrice.to_i
        absNumber  = (inputDepo - drinkPrice).abs
        if inputDepo > drinkPrice
            puts_message_success_purchase()
            puts_message_change(absNumber)
        else
            puts_message_failure_purchase()
            puts_message_not_enough(absNumber)
        end
    end

    def add_drinks(drinkList)
        @drinks = []
        if drinkList.is_a?(Array)
            drinkList.each do |list|
                drink = Drink.new(list[:num],list[:name],list[:price])
                @drinks.push(drink.array_drink)
            end
        else
            list = []
            drinkList.each do |key, value|
                list.push(value)
            end
            drink = Drink.new(list[0],list[1],list[2])
            @drinks.push(drink.array_drink)
        end
        @drinks
    end

    def display_drinks
        puts "ドリンクの一覧を表示します。"
        @drinks.each do |drink|
            puts " #{drink[0]}：#{drink[1]}（#{drink[2]}円）"
        end
        puts_message_line()
    end

end