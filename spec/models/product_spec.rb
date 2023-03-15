require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'the product has name, price, quantity and category fields' do
      @product = Product.new(
        name: "product1", 
        price_cents: 300, 
        quantity: 5, 
        category: @category)
      @product.save
      expect(@product).to be_present
    end
    
    it 'is not valid without a name' do
      category = Category.new
      @product = Product.new({
        category: category,
        name: nil,
        quantity: 50,
        price: 29.99
      })
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      category = Category.new
      @product = Product.create({
        category: category,
        name:  'Product',
        quantity: 50,
        price_cents: nil
      })
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'is not valid without a quantity' do
      category = Category.new
      @product = Product.create({
        category: category,
        name:  'Product',
        quantity: nil,
        price: 29.99
      })
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.create({
        category: nil,
        name:  'Product',
        quantity:50,
        price: 29.99
      })
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end