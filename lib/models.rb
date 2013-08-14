require 'money'

class Product < Struct.new(:name, :price)
end

class Order < Struct.new(:total, :tax_total, :items)
end

class LineItem < Struct.new(:order, :cost, :quantity, :product)
end

