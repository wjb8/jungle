require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with all attributes" do
      @category = Category.new
      @product = Product.new(name: "test", price_cents: "4700", quantity: "3", category: @category)
      expect(@product).to be_valid
    end


    it "is not valid without a name" do
      @category = Category.new
      @product = Product.new(name: nil, price_cents: "4700", quantity: "3", category: @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @product = Product.new(name: "test", price_cents: nil, quantity: "3", category: @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.new(name: "test", price_cents: "4700", quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @category = Category.new
      @product = Product.new(name: "test", price_cents: "4700", quantity: "3", category: nil)
      expect(@product).to_not be_valid
    end

  end
end
