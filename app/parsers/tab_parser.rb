# encoding: utf-8

require 'bigdecimal'

# TabParser
class TabParser
  attr_reader :content, :results

  def self.process(content)
    new(content).process!
  end

  def initialize(content)
    @content = content
    @results = []
  end

  def process!
    require 'csv'
    @results = current_csv.map do |row|
      normalize_row(row.to_hash)
    end
    self
  end

  private

  def normalize_row(row_hash)
    attributes = {}
    row_hash.map do |key, value|
      attribute = slugify(key)
      attributes[attribute] = normalize_for(attribute, value)
    end
    attributes
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

  def current_csv
    CSV.parse(content,
              col_sep: "\t",
              headers: :first_row,
              encoding: 'UTF-8')
  end
end
