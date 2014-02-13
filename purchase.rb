class Purchase
	attr_accessor :goods

	def initialize goods
		@goods = goods
	end

	def quantity
		@quantity = @goods.split(" ").first.to_i
	end

	def price
		@price = @goods.split(" at ").last.to_f
	end

	def item
		init = @goods.split(" at ").first.strip
		a = quantity		#method quantity returns value and stores in variable.
		init.split(a.to_s).last.strip
	end

	def item_name
		init = @goods.split(" at ").first.strip
	end

	def no_tax item
		nontaxable = ["chocolates", "chocolate bar", "book", "pills"]
		nontaxable.each do |t|
			if item.include? t
				return true
			end
		end
	end

	def basic_tax
		cost = price * quantity
		tax = 0
		a = item
		notTaxed = no_tax a

		if notTaxed == true
			tax = 0
		else
			tax = (cost * 0.10).round(2)
		end
		return tax
	end

	def no_duty item
		if item.include? "imported"
			return true
		end
	end

	def import_tax
		cost = price * quantity
		tax = 0
		a = item
		duty = no_duty a

		if duty == true
			tax = (cost * 0.05).round(2)
		else
			tax = 0
		end
		return tax
	end

	def round_by d
		((d*20).ceil)/20.0
	end

	def taxes
		tax1 = basic_tax
		tax2 = import_tax
		total = tax1 + tax2
		round_by total
	end

	def output
		tax = taxes
		prices = price * quantity
		total = ('%.2f' % (tax + prices))
		item = item_name
		return item + ": " + total.to_s
	end

	def sales
		tax = taxes
		return tax
	end

	def total
		tax = taxes
		cost = price * quantity
		cost + tax
	end

end