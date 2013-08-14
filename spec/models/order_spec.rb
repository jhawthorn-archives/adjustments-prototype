require 'spec_helper'

describe Order do
  let(:order){ Order.new }
  subject{ order }
  context 'a new order' do
    specify{ subject.total.should == Money.new(0.0, 'USD') }
    specify{ subject.tax_total.should == Money.new(0.0, 'USD') }
  end
  describe 'add_product' do
    let(:product){ Product.new('Half Life 3', '39.99') }
    before do
      order.add_product product
    end
    specify{ order.items.count.should == 1 }
    specify{ order.item_total.should == Money.new(39.99, 'USD') }
    specify{ order.total.should == order.item_total + order.tax_total }
    describe "added item" do
      subject{ order.items.first }
      specify{ subject.product.should == product }
      specify{ subject.money.should == Money.new(39.99, 'USD') }
    end
  end
end
