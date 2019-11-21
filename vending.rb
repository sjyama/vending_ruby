require './drink'
require './message'

class Vending
    include VendingMessage
    attr_reader :selected_drink

    # 入金の依頼
    def deposits
        puts_message_request_deposit()
        input = gets.chomp
        if chk_number?(input)
            puts_message_success_deposit(input)
        else
            deposits
        end
        depo  = Deposit.new(input)
        depo.deposited_money
    end

    # 購入商品の選択依頼
    def orders(drink_list)
        puts_message_line()
        miss_order = true
        while miss_order do
            puts_message_request_order()
            selected_drink_num = gets.chomp
            next unless chk_number?(selected_drink_num)

            selected_drink_num = selected_drink_num.to_i
            next unless chk_stock?(selected_drink_num, drink_list)

            miss_order = false
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
    def chk_stock?(selected_drink_num, drink_list)
        return_flg = false
        drink_list.each do |drink|
            if drink.num == selected_drink_num
                puts_message_detail_order(drink)
                @selected_drink = drink
                return_flg = true
                break
            end
        end
        puts_message_not_exist_drinks() unless return_flg
        return_flg
    end

    # 会計
    def calculate(deposit, drink_price)
        puts_message_line()
        deposit     = deposit.to_i
        drink_price = drink_price.to_i
        abs_number  = (deposit - drink_price).abs
        if deposit > drink_price
            puts_message_success_purchase()
            puts_message_change(abs_number)
        else
            puts_message_failure_purchase()
            puts_message_not_enough(abs_number)
        end
    end

    # 飲み物の初期登録
    def add_drinks(drink_list)
        @drinks = []
        if drink_list.is_a?(Array)
            drink_list.each do |list|
                drink = Drink.new(list[:num],list[:name],list[:price])
                @drinks.push(drink)
            end
        else
            list = []
            drink_list.each do |key, value|
                list.push(value)
            end
            drink = Drink.new(list[0],list[1],list[2])
            @drinks.push(drink)
        end
        @drinks
    end

    # 飲み物一覧の出力
    def display_drinks
        puts_message_display_drinks()
        @drinks.each do |drink|
            puts " #{drink.num}：#{drink.name}（#{drink.price}円）"
        end
        puts_message_line()
    end

end