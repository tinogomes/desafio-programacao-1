# encoding: utf-8

class Sale < ActiveRecord::Base
  has_many :items, class_name: 'SaleItem'

  validates :transaction_key, presence: true, uniqueness: true
end
