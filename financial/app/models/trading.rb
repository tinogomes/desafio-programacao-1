# encoding: utf-8

class Trading
  def self.create!(results, transaction_key = nil)
    new(results, transaction_key).create!
  end

  def initialize(results, transaction_key)

  end

  private

  attr_reader :results, :transaction_key
end
