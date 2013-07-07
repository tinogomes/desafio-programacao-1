# encoding: utf-8

class Sale < ActiveRecord::Base
  has_many :items, class_name: 'SaleItem'

  validates :transaction_key, presence: true, uniqueness: true

  before_save :calculate_total

  def to_param
    transaction_key
  end

  private

  def calculate_total
    self.total_price = 0
    self.total_price = self.items.reduce(0) do |sum, item|
      sum + (item.purchase_count * item.item_price)
    end
  end
end
