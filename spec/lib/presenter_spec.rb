# encoding: UTF-8

require 'ostruct'
require 'presenter'

describe Presenter do
  let(:some_resource) { OpenStruct.new({ name: 'John Doe' }) }
  let(:presenter) { Presenter.new(some_resource) }

  subject { presenter }

  its(:resource) { should eq some_resource }
  its(:name) { should eql 'John Doe' }

  it 'should raise undefined method for resource' do
    expect { presenter.email }.to raise_error(NoMethodError, /OpenStruct/)
  end
end
