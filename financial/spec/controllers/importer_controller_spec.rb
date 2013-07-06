# encoding: utf-8

require 'spec_helper'

describe ImporterController do
  describe 'GET "index"' do
    it 'returns http success' do
      get 'new'

      expect(response).to be_success
    end
  end

  describe 'POST "create"' do
    let(:file) { fixture_file_upload('example_input.tab') }

    it 'should upload and process file' do
      ImportFileProcessor.should_receive(:run).with(file)

      post 'create', file: file

      expect(response).to redirect_to(root_path)
    end

    it 'should upload and process file' do
      expect { post 'create', file: file }.to change(Sale, :count).to(4)
    end
  end
end
