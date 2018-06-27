require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Javier") }
  subject(:brownie) { Dessert.new("Brownie", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("Brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Brownie", "50", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) { brownie.add_ingredient("milk") }

    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to eq(["milk"])
    end

  end

  describe "#mix!" do
    before(:each) do
      brownie.add_ingredient("milk")
      brownie.add_ingredient("sugar")
      brownie.add_ingredient("lettuce")
      brownie.mix!
    end
    it "shuffles the ingredient array" do
      expect(brownie.ingredients).to_not eq(["milk", "sugar", "lettuce"])
    end
  end

  describe "#eat" do
    before(:each) { brownie.eat(20) }
    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(30)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(50) }.to raise_error
    end
  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Javier the Great Baker")
      expect(brownie.serve).to eq("Chef Javier the Great Baker has made 50 Brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
