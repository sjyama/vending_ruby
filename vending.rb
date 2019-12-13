require './drink'
require './message'

class Vending
  include VendingMessage

  # 飲み物の初期登録
  def add(drink_list)
    @drinks = []
    if drink_list.is_a?(Array)
      drink_list.each {|params| @drinks << build_drink(params) }
    else
      @drinks << build_drink(params)
    end
  end

  # 飲み物一覧の出力
  def display_drinks
    puts_message_display_drinks(@drinks)
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
    while true do
      puts_message_request_order()
      selected_drink_num = gets.chomp
      next unless chk_number?(selected_drink_num)

      break drink_present?(selected_drink_num)
    end
  end

  # 会計
  def calculate
    puts_message_line()
    drink_price = @selected_drink.price.to_i
    change = (@deposited_money - drink_price).abs
    if @deposited_money >= drink_price
      puts_message_success_purchase()
      puts_message_change(change)
    else
      puts_message_failure_purchase()
      puts_message_not_enough(change)
    end
  end

  private

  def build_drink(params)
    Drink.new(params)
  end

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
  def drink_present?(selected_drink_num)
    selected_drink_num = selected_drink_num.to_i

    @drinks.each do |drink|
      @selected_drink = drink if drink.id == selected_drink_num
    end
    if @selected_drink
      puts_message_detail_order(@selected_drink)
    else
      puts_message_not_exist_drinks()
    end

    @selected_drink
  end

end
