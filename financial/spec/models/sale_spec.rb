# encoding: utf-8

require 'spec_helper'

describe Sale do
  context 'for invalid' do
    Sale::REQUIRED_ATTRIBUTES.each do |attribute|
      it "should require #{attribute}" do
        expect(subject).to have(1).errors_on(attribute)
      end
    end

    it 'should reject invalid number for purchase_count' do
      sale = Sale.new(purchase_count: 0)
      expect(sale).to have(1).errors_on(:purchase_count)
    end
  end
end
