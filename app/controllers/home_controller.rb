# encoding: utf-8

class HomeController < ApplicationController
  def index
    redirect_to sales_path
  end
  
  def ping
    render text: 'pong'
  end
end
