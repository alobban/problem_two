require 'spec_helper'

describe Purchase do

	before :each do
		@purchase = Purchase.new "Goods"
	end

	describe "#new" do
		it "returns an object of Purchase" do
			@purchase.should be_an_instance_of Purchase
		end
	end

	describe "#goods" do
		it "returns the correct input" do
			@purchase.goods.should eql "Goods"
		end
	end

	describe "quantity" do
		it "returns the quantity per item" do
			@purchase = Purchase.new "1 book at 12.49"
			@purchase.quantity.should eql 1
		end
	end

	describe "price" do
		it "returns the price associated with item" do
			@purchase = Purchase.new "1 book at 12.49"
			@purchase.price.should eql 12.49
		end
	end

	describe "item" do
		it "returns the list name of the item" do
			@purchase = Purchase.new "1 music CD at 14.99"
			@purchase.item.should eql "music CD"
		end
	end


	describe "basic_tax" do
		it "returns the basic sales tax of taxable items" do
			@purchase = Purchase.new "1 music CD at 15.00"
			@purchase.basic_tax.should eql 1.50
		end

		it "returns 0 for nontaxble items" do
			@purchase = Purchase.new "1 box of chocolates at 12.49"
			@purchase.basic_tax.should eql 0
		end
	end

	describe "import_tax" do
		it "returns 0 for none imported goods" do
			@purchase = Purchase.new "1 box of chocolates at 1.00"
			@purchase.import_tax.should eql 0
		end

		it "returns the import duty on all imported goods" do
			@purchase = Purchase.new "1 imported box of chocolates at 11.25"
			@purchase.import_tax.should eql 0.56
		end
	end

	describe "output" do
		it "returns formatted item receipt output" do
			@purchase = Purchase.new "1 imported box of chocolates at 11.25"
			@purchase.output.should eql "1 imported box of chocolates: 11.85"
		end
	end

	describe "sales" do
		it "returns the total calculated tax" do
			@purchase = Purchase.new "1 imported box of paper at 5.00"
			@purchase.sales.should eql 0.75
		end
	end

	describe "total" do
		it "returns the complete cost" do
			@purchase = Purchase.new "1 imported box of paper at 5.00"
			@purchase.total.should eql 5.75
		end
	end

end
