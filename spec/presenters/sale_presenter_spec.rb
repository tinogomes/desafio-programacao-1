# encoding: UTF-8

require 'spec_helper'

describe SalePresenter do
  let(:sale) { OpenStruct.new(total_price: 1234.56, items: []) }

  subject { SalePresenter.new(sale) }

  its(:total_price) do
    should eql('$1,234.56')
  end
end
