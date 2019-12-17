require './drink'
require './message'

class Vending
    include Message
    attr_reader :selected_drink

    # 飲み物の初期登録
    def add_drinks(drink_list)
        @drinks = []
        if drink_list.is_a?(Array)
            drink_list.each do |list|
                drink = build_drink(list)
                @drinks.push(drink)
            end
        else
            drink = build_drink(drink_list)
            @drinks.push(drink)
        end
    end

    # 飲み物一覧の出力
    def display_drinks
        puts_message_display_drinks
        @drinks.each do |drink|
            puts " #{drink.num}：#{drink.name}（#{drink.price}円）"
        end
        puts_message_line
    end

    # 入金の依頼
    def deposits
        puts_message_request_deposit
        money = gets.chomp

        if number?(money)
            puts_message_success_deposit(money)
            build_deposited_money(money)
        else
            deposits
        end
    end

    # 購入商品の選択依頼
    def orders
        puts_message_line
        while true do
            puts_message_request_order
            selected_drink_num = gets.chomp
            next unless number?(selected_drink_num)

            break if chk_stock?(selected_drink_num)
        end
    end

    # 会計
    def calculate
        puts_message_line
        drink_price = @selected_drink.price.to_i
        change = (@deposited_money - drink_price).abs

        if @deposited_money >= drink_price
            puts_message_success_purchase(change)
        else
            puts_message_failure_purchase(change)
            deposits
            calculate
        end
    end

    private

    # Drinkインスタンスの作成
    def build_drink(params)
        Drink.new(params)
    end

    # 数値チェック
    def number?(num)
        # 先頭(\A)から末尾(\z)までが0~9であるか判定
        if (num =~ /\A[0-9]+\z/)
            true
        else
            puts_message_not_number
            false
        end
    end

    # 在庫チェック
    def chk_stock?(selected_drink_num)
        selected_drink_num = selected_drink_num.to_i
        @drinks.each do |drink|
            @selected_drink = drink if drink.num == selected_drink_num
        end

        if @selected_drink
            puts_message_detail_order(@selected_drink)
        else
            puts_message_not_exist_drinks
        end

        @selected_drink
    end

    def build_deposited_money(money)
        if @deposited_money
            @deposited_money += money.to_i
            puts_message_total_deposit(@deposited_money)
        else
            @deposited_money = money.to_i
        end
    end
end