require 'spec_helper'

describe Order do
  context 'a new order' do
    subject{ Order.new }
    specify{ subject.total.should == Money.new(0.0, 'USD') }
    specify{ subject.tax_total.should == Money.new(0.0, 'USD') }
  end
end
