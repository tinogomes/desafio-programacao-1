# encoding: utf-8

require 'spec_helper'

describe Trading do
  describe '#create!' do
    it 'should delegate to an instance trading' do
      trading = double(:trading)
      trading.should_receive(:create!)
      Trading.should_receive(:new).with([1, 2, 3], '123').and_return(trading)

      Trading.create!([1, 2, 3], '123')
    end
  end

  let(:transaction_key) { '123123123123' }
  let(:item) { define_item }
  let(:results) { [item] }

  subject { Trading.new(results, transaction_key) }

  it 'should store sales' do
    expect(subject.create!).to change(Sale, :count).to(1)
  end
end
