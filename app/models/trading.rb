# encoding: utf-8

class Trading
  class InvalidSales < RuntimeError; end

  attr_reader :sale

  def self.create!(results, transaction_key = nil)
    new(results, transaction_key).create!
  end

  def initialize(results, transaction_key)
    @results = results
    @transaction_key = transaction_key
  end

  def create!
    load_sales!
    save_all_sales!

    self
  end

  private

  attr_reader :results, :transaction_key

  def load_sales!
    @sale = Sale.new(transaction_key: transaction_key)

    results.each do |attributes|
      @sale.items.build(attributes)
    end
  end

  def save_all_sales!
    raise InvalidSales if invalid_sales?
    sale.save!
  end

  def invalid_sales?
    sale.items.map(&:valid?).include?(false)
  end
end
