class Drink
	attr_reader :id, :name, :price

	@@id = 0

	def initialize(**params)
		@@id += 1
		@id = @@id
		@name  = params[:name]
		@price = params[:price]
	end

end
