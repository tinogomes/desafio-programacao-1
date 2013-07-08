# encoding: UTF-8

require 'presenter'

# Presenter for Sale model
class SalePresenter < ::Presenter
  def total_price
    helpers.number_to_currency _total_price
  end

  def items
    _items.map { |item| Item.new(item) }
  end

  # Presenter for SaleItem model
  class Item < ::Presenter
    def item_price
      helpers.number_to_currency _item_price
    end

    def item_total
      helpers.number_to_currency _purchase_count * _item_price
    end
  end
end
