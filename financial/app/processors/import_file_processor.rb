# encoding: utf-8

class ImportFileProcessor
  attr_reader :content

  def self.run(file)
    new(file).run!
  end

  def initialize(file)
    @content = file.read.force_encoding('utf-8')
  end

  def run!(parser = TabParser, model = Trading)
    transaction_key = calculate_key_for_content
    results = parser.process(content).results
    model.create!(results, transaction_key)
    self
  end

  def calculate_key_for_content
    @key_for_content ||= Digest::MD5.hexdigest(content)
  end
end
