# encoding: utf-8

class ImportFileProcessor
  attr_reader :file

  def self.run(file)
    new(file).run!
  end

  def initialize(file)
    @file = file
  end

  def run!(parser = TabParser, model = Trading)
    transaction_key = calculate_key_for_file
    results = parser.process(file).results
    model.create!(results, transaction_key)
    self
  end

  def calculate_key_for_file
    @key_for_file ||= Digest::MD5.hexdigest(file.read.to_s)
  end
end
