# encoding: utf-8

require 'bigdecimal'

# TabParser
class TabParser
  attr_reader :file, :results

  def self.process(file)
    new(file).process!
  end

  def initialize(file)
    @file = file
    @results = []
  end

  def process!
    require 'csv'
    @results = CSV.parse(file, col_sep: "\t", headers: :first_row).map do |row|
      normalize_row(row.to_hash)
    end
    self
  end

  def normalize_row(hash)
    attributes = {}
    hash.map do |key, value|
      attribute = slugify(key)
      attributes[attribute] = normalize_for(attribute, value)
    end
    OpenStruct.new(attributes)
  end

  def normalize_for(key, value)
    case key
    when 'item_price' then ::BigDecimal.new(value)
    when 'purchase_count' then value.to_i
    else value
    end
  end

  def slugify(string)
    string.tr(' ', '_')
  end
end
