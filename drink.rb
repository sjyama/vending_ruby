class Drink
	attr_reader :num
	attr_reader :name
	attr_reader :price

	def initialize(num, name, price)
		@num   = num
		@name  = name
		@price = price
	end
end
