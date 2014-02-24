require_relative 'purchase'

input = {}
key = ""
value = []

def filter key, value
	hash = Hash.new
	hash[key.chomp] = value
	return hash
end 

file = ARGV[0]

File.open(file, "r") do |f|
	# n-1 hashes are captured in the block below
	f.each_line do |line|
		if line.match(/\w{1,5}\s\d(:)/) 
			then key = line 
		elsif line.match(/^(\d+) (.*) at (\d+\.\d+)$/) 
			then value << line.chomp
		else 
			temp = filter key, value
			value = []
			temp.each do |k, v|
				input[k] = v
			end				
		end
	end
	# The nth hash is captured below
	temp = filter key, value
	value = []
	temp.each do |k, v|
		input[k] = v
	end	
end


puts "OUTPUT"
input.each do |key, array|
	puts "\nOutput " + key.split(" ").last + ":"

	salesTax = 0
	total = 0

	array.each do |ea|
		@purchase = Purchase.new ea
		puts @purchase.output
		salesTax += @purchase.sales
		total += @purchase.total
	end

	puts "Sales Taxes: " + ('%.2f' % salesTax).to_s
	puts "Total: " + ('%.2f' % total).to_s

end
