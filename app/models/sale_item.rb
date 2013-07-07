# encoding: utf-8

class SaleItem < ActiveRecord::Base
  REQUIRED_ATTRIBUTES = [
    :purchaser_name,
    :item_description,
    :item_price,
    :merchant_address,
    :merchant_name,
    :purchase_count
  ]

  belongs_to :sale

  validates(*REQUIRED_ATTRIBUTES, presence: true)

  validates :purchase_count,
            numericality: {
              allow_nil: true,
              greater_than_or_equal_to: 1,
              only_integer: true
            }
end
