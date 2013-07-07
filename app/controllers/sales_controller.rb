# encoding: UTF-8

class SalesController < ApplicationController
  def index
    @sales = Sale.order(created_at: :desc).page params[:page]
  end

  def show
    @sale = Sale.find_by_transaction_key! params[:id]
  end

  def create
    processor = ImportFileProcessor.run(params[:file])

    redirect_to processor.trading.sale
  end
end
