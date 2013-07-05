# encoding: utf-8

class ImportFileProcessor
  attr_reader :file

  def self.run(file)
    new(file).run
  end

  def initialize(file)
    @file = file
  end

  def run(parser = TabParser, model = Trade)
    parser.process(file).results.each do |row_data|
      model.create!(row_data)
    end
  end
end
