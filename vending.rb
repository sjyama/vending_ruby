require './drink'
require './message'

class Vending
  include Message

  def initialize
    @drinks = []
  end

  # 飲み物の初期登録
  def add_drink(params)
    if params.is_a?(Array)
      params.each {|params| @drinks << build_drink(params) }
    else
      @drinks << build_drink(params)
    end
  end

  # 飲み物一覧の出力
  def display_drinks
    drink_info_message(@drinks)
  end

  # 入金の依頼
  def deposits
    request_deposit_message

    money = gets.chomp

    unless number?(money)
      puts_message_not_number
      deposits
    end

    success_deposit_message(money)

    build_deposited_money(money)
  end

  # 購入商品の選択依頼
  def orders
    while true do
      request_order_message
      selected_drink_num = gets.chomp
      next unless number?(selected_drink_num)
      break if drink_present?(selected_drink_num)
    end
  end

  # 会計
  def calculate
    selected_drink_price = @selected_drink.price
    change = (@deposited_money - selected_drink_price).abs

    if @deposited_money >= selected_drink_price
      success_purchase_message(change)
    else
      failure_purchase_message(change)
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
    (num =~ /^[0-9]+$/) ? true : false
  end

  # 在庫チェック
  def drink_present?(selected_drink_num)
    selected_drink_num = selected_drink_num.to_i

    @drinks.each do |drink|
      @selected_drink = drink if drink.id == selected_drink_num
    end

    if @selected_drink
      detail_order_message(@selected_drink)
    else
      not_exist_drinks_message
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
