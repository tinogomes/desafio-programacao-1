# encoding: utf-8

require 'spec_helper'

describe HomeController do

  describe 'GET "index"' do
    it 'returns http success' do
      get 'index'

      redirect_to sales_path
    end
  end

end
