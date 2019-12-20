require './drink'
require './vending_message'

class Vending
  include VendingMessage

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

  # 入金の依頼
  def deposits
    request_deposit_message

    inputed_money = gets.chomp

    unless number?(inputed_money)
      not_number_message
      deposits
    end

    build_deposited_money(inputed_money)
    success_deposit_message(inputed_money, @deposited_money)
  end

  # 飲み物一覧の出力
  def display_drinks
    drink_info_message(@drinks, @deposited_money)
  end

  # 購入商品の選択依頼
  def request_order
    while true do
      request_order_message
      selected_drink_num = gets.chomp
      next unless number?(selected_drink_num)

      if drink_present?(selected_drink_num)
        detail_order_message(@selected_drink)
        break
      end
    end
  end

  # 会計
  def processing_payment
    change = (@deposited_money - @selected_drink.price).abs

    if available?
      success_purchase_message(change)
    else
      failure_purchase_message(change)
      deposits
      display_drinks
      request_order
      processing_payment
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

    unless @selected_drink
      not_exist_drinks_message
      return false
    end

    true
  end

  def build_deposited_money(money)
    if @deposited_money
      @deposited_money += money.to_i
    else
      @deposited_money = money.to_i
    end
  end

  def available?
    @deposited_money >= @selected_drink.price
  end
end
