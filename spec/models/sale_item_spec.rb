# encoding: UTF-8

require 'spec_helper'

describe SaleItem do
  context 'for invalid' do
    SaleItem::REQUIRED_ATTRIBUTES.each do |attribute|
      it "should require #{attribute}" do
        expect(subject).to have(1).errors_on(attribute)
      end
    end

    it 'should reject invalid number for purchase_count' do
      sale = SaleItem.new(purchase_count: 0)
      expect(sale).to have(1).errors_on(:purchase_count)
    end
  end
end
