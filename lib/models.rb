require 'money'
require 'bigdecimal'

class Product
  attr_reader :name, :price
  def initialize name, price
    @name = name
    @price = BigDecimal.new(price)
  end
end

class LineItem
  attr_reader :cost, :quantity, :product, :currency
  def initialize product, quantity, currency
    @product, @quantity, @currency = product, quantity, currency
    @cost = product.price
  end
  def money
    Money.new(cost * quantity, currency)
  end
  def taxation
    BigDecimal.new('0.14')
  end
end

class Adjustment
  attr_reader :amount, :currency
  def initialize amount, currency
    @amount, @currency = amount, currency
  end
  def money
    Money.new(amount, currency)
  end
  def taxation
    BigDecimal.new('0.14')
  end
end

class Order
  attr_reader :items
  def initialize
    @items = []
  end
  def currency
    'USD'
  end
  def total
    item_total + tax_total
  end
  def item_total
    items.inject(zero) do |m,item|
      m + item.money
    end
  end
  def tax_total
    items.inject(zero) do |m,item|
      m + item.money * item.taxation
    end
  end
  def add_product product, quantity=1
    items << LineItem.new(product, quantity, currency)
  end
  def add_adjustment adjustment
    items << adjustment
  end
  private
  def zero
    Money.new(0, currency)
  end
end

