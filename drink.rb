class Drink
	attr_reader :id, :name, :price

	@@id = 0

	def initialize(hash_drink)
		@@id += 1
		@id = @@id
		@name  = hash_drink[:name]
		@price = hash_drink[:price]
	end

end
