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
    puts_message_request_deposit

    money = gets.chomp

    unless number?(money)
      puts_message_not_number
      deposits
    end

    puts_message_success_deposit(money)

    build_deposited_money(money)
  end

  # 購入商品の選択依頼
  def orders
    while true do
      puts_message_request_order
      selected_drink_num = gets.chomp
      next unless number?(selected_drink_num)

      break if drink_present?(selected_drink_num)
    end
  end

  # 会計
  def calculate

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

  def build_drink(params)
    Drink.new(params)
  end

  # 数値チェック
  def number?(num)
    # 先頭(\A)から末尾(\z)までが0~9であるか判定
    # @isNumber != (num =~ /\A[0-9]+\z/)
    (num =~ /\A[0-9]+\z/) ? true : false
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
      puts_message_not_exist_drinks
    end

    @selected_drink
  end

  def build_deposited_money(money)
    if @deposited_money
      @deposited_money += money.to_i
    else
      @deposited_money = money.to_i
    end
  end
end
