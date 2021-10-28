require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new("cake", 10, "gordon ramsay")}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(10) 
    end

    it "starts ingredients as an empty array" do 
      expect(cake.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("pie", "fifty", "Your actual dad") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("eggs")
      cake.add_ingredient("flour")
      cake.add_ingredient("sugar")
      expect(cake.ingredients).to eq(["eggs", "flour", "sugar"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      cake.add_ingredient("eggs")
      cake.add_ingredient("flour")
      cake.add_ingredient("sugar")
      expect(cake.mix!).to include("eggs", "flour", "sugar")
      expect(cake.mix!).to_not eq(["eggs", "flour", "sugar"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { cake.eat(15) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cake.serve).to include("Gordon Ramsay")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      allow(chef).to receive(:make_more)
    end
  end
end
