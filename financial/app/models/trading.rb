# encoding: utf-8

class Trading
  class InvalidSales < RuntimeError; end

  attr_reader :sales

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
    @sales = []

    results.each do |attributes|
      @sales << Sale.new(attributes.merge(transaction_key: transaction_key))
    end
  end

  def save_all_sales!
    raise InvalidSales if invalid_sales?
    sales.map(&:save!)
  end

  def invalid_sales?
    sales.map(&:valid?).include?(false)
  end
end
