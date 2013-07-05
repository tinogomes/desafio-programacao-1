# encoding: utf-8

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
      normalize(row.to_hash)
    end
    self
  end

  def normalize(hash)
    {}.tap do |resulting|
      hash.map { |key, value| resulting[slugify(key)] = value }
    end
  end

  def slugify(string)
    string.tr(' ', '_')
  end
end
