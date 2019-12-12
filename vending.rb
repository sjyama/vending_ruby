require './drink'
require './message'

class Vending
    include VendingMessage
    attr_reader :selected_drink

    # 飲み物の初期登録
    def add(drinks)
        @drinks = []
        if drinks.is_a?(Array)
            drinks.each do |list|
                drink = Drink.new(list)
                @drinks.push(drink)
            end
        else
            drink = Drink.new(drinks)
            @drinks.push(drink)
        end
        @drinks
    end

    # 飲み物一覧の出力
    def display_drinks
        puts_message_display_drinks()
        @drinks.each do |drink|
            puts " #{drink.id}：#{drink.name}（#{drink.price}円）"
        end
        puts_message_line()
    end

    # 入金の依頼
    def deposits
        puts_message_request_deposit()
        input = gets.chomp
        if chk_number?(input)
            puts_message_success_deposit(input)
            @deposited_money = input.to_i
        else
            puts_message_not_number
            deposits
        end
    end

    # 購入商品の選択依頼
    def orders
        puts_message_line()
        miss_order = true
        while miss_order do
            puts_message_request_order()
            selected_drink_num = gets.chomp
            next unless chk_number?(selected_drink_num)

            selected_drink_num = selected_drink_num.to_i
            next unless chk_stock?(selected_drink_num, @drinks)

            miss_order = false
        end
    end

    # 会計
    def calculate(drink_price)
        puts_message_line()
        drink_price = drink_price.to_i
        change  = (@deposited_money - drink_price).abs
        if @deposited_money >= drink_price
          puts_message_success_purchase()
          puts_message_change(change)
        else
          puts_message_failure_purchase()
          puts_message_not_enough(change)
        end
    end

    private

    # 数値チェック
    def chk_number?(num)
        # 先頭(\A)から末尾(\z)までが0~9であるか判定
        # @isNumber != (num =~ /\A[0-9]+\z/)
        if (num =~ /\A[0-9]+\z/)
            true
        else
            false
        end
    end

    # 在庫チェック
    def chk_stock?(selected_drink_num, drink_list)
        return_flg = false
        drink_list.each do |drink|
            puts drink.id
            if drink.id == selected_drink_num
                puts_message_detail_order(drink)
                @selected_drink = drink
                return_flg = true
                break
            end
        end
        puts_message_not_exist_drinks() unless return_flg
        return_flg
    end

end
