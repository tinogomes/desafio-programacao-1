# encoding: utf-8

require_relative '../../app/parsers/tab_parser'

describe TabParser do
  let(:content) { File.open('./spec/fixtures/example_input.tab').read }
  let(:parser) { TabParser.new(content) }

  describe '#process' do
    it 'should delegate to an instance parser' do
      parser = double(:parser)
      parser.should_receive(:process!)
      TabParser.should_receive(:new).with(content).and_return(parser)

      TabParser.process(content)
    end
  end

  subject { parser.process! }

  it 'should process csv tab content to array hashes' do
    expect(subject.results.count).to eql(4)
  end

  describe 'checking first row' do
    subject { OpenStruct.new(parser.process!.results.first) }

    its(:item_description) { should eql 'R$10 off R$20 of food' }
    its(:item_price) { should eql BigDecimal.new('10.0') }
    its(:merchant_address) { should eql '987 Fake St' }
    its(:merchant_name) { should eql %Q{Bob's Pizza} }
    its(:purchase_count) { should eql 2 }
    its(:purchaser_name) { should eql 'João Silva' }
  end
end
