# encoding: utf-8

class Sale < ActiveRecord::Base
  validates :purchaser_name, :item_description, :item_price,
            :merchant_address, :merchant_name,
            presence: true

  validates :purchase_count,
            presence: true,
            numerally: {
              greater_than_or_equal_to: 0,
              only_integer: true
            }

  validates :transaction_key, presence: true, uniqueness: true
end
