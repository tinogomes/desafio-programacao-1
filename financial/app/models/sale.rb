# encoding: utf-8

class Sale < ActiveRecord::Base
  REQUIRED_ATTRIBUTES = [
    :purchaser_name,
    :item_description,
    :item_price,
    :merchant_address,
    :merchant_name,
    :purchase_count,
    :transaction_key
  ]

  validates(*REQUIRED_ATTRIBUTES, presence: true)

  validates :purchase_count,
            numericality: {
              allow_nil: true,
              greater_than_or_equal_to: 1,
              only_integer: true
            }

  validates :transaction_key, uniqueness: true
end
