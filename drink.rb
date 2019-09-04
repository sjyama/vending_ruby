class Drink
	attr_reader :array_drink

	def initialize(num, name, price)
		@array_drink = [num, name, price]
	end
end
