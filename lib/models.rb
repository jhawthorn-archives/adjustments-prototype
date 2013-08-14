require 'money'

class Product < Struct.new(:name, :price)
end

class Order < Struct.new(:items)
  def currency
    'USD'
  end
  def total
    Money.new(0.0, currency)
  end
  def tax_total
    Money.new(0.0, currency)
  end
end

class LineItem < Struct.new(:order, :cost, :quantity, :product)
end

