require_relative 'purchase'

input = {}
key = ""
value = []

def filter key, value
	hash = Hash.new
	hash[key.chomp] = value
	return hash
end 

File.open("input.txt", "r") do |f|
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


input ||= {
	"Input 1" => ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"],
	"Input 2" => ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"],
	"Input 3" => ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
}

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
