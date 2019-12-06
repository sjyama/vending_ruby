class Drink
	attr_reader :num
	attr_reader :name
	attr_reader :price

	def initialize(hash_drink)
		@num   = hash_drink[:num]
		@name  = hash_drink[:name]
		@price = hash_drink[:price]
	end
end
