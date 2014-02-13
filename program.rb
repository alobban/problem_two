require_relative 'purchase'

puts "This program calculates the basic sales tax which is"
puts "applicable at a rate of 10% on "
puts "all goods, except books, food, and medical products that are exempt."
puts "Import duty is an additional 5% on all imported goods, with no exemptions."

moreItems = 'y'
g = []

until moreItems == 'n'
puts ""
puts "Enter name of product: "
input = gets.chomp.strip

g << input

puts "Do you have more goods?" 
print "[Type 'Y' for YES | 'N' for NO]: "
moreItems = gets.chomp.downcase
end

salesTax = 0
total = 0

puts "\nOutput: \n\n"

g.each do |ea|
	@purchase = Purchase.new ea
	puts @purchase.output
	salesTax += @purchase.sales
	total += @purchase.total
end

puts "Sales Taxes: " + ('%.2f' % salesTax).to_s
puts "Total: " + ('%.2f' % total).to_s