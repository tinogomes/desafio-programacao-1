# encoding: UTF-8

require 'spec_helper'

describe SalesController do

  describe 'GET "new"' do
    it 'returns http success' do
      get 'new'

      expect(response).to be_success
    end
  end

  describe 'POST "create"' do
    let(:file) { fixture_file_upload('example_input.tab') }

    it 'should upload and process file' do
      expect { post 'create', file: file }.to change(SaleItem, :count).to(4)
    end
  end

  describe 'GET "index"' do
    it 'returns http success' do
      get 'index'

      response.should be_success
    end
  end

  describe 'GET "show"' do
    xit 'returns http success' do
      get 'show'

      response.should be_success
    end
  end

end
