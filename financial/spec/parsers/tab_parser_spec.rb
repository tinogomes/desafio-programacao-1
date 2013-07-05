# encoding: utf-8

require_relative '../../app/parsers/tab_parser'

describe TabParser do
  let(:file) { File.open('./spec/fixtures/example_input.tab') }

  subject { TabParser.new(file) }

  before { subject.process! }

  it 'should process csv tab file to array hashes' do
    expect(subject.results.count).to eql(4)
  end

  describe 'checking first row' do
    let(:first_row) { subject.results.first }

    it 'should be equal to expected hash' do
      expect(first_row).to eql({
        'item_description' => 'R$10 off R$20 of food',
        'item_price' => '10.0',
        'merchant_address' => '987 Fake St',
        'merchant_name' => %Q{Bob's Pizza},
        'purchase_count' => '2',
        'purchaser_name' => 'João Silva'
      })
    end
  end
end
