# encoding: utf-8
# rubocop:disable SpaceAroundOperators

module FacilitiesSpecHelper
  def build_sale
    Sale.new(transaction_key: random_md5).tap do |sale|
      rand(1..4).times do
        sale.items.build define_item
      end
    end
  end

  def define_item
    {
      purchaser_name: Faker::Name.name,
      item_description: Faker::Product.product_name,
      item_price: decimal_generator,
      purchase_count: rand(5) + 1,
      merchant_address: Faker::Address.street_address,
      merchant_name: Faker::Name.name
    }
  end

  def decimal_generator
    a_number = (rand * (10 ** rand(4))).round(2)

    BigDecimal.new(a_number.to_s)
  end

  def random_md5
    '1234567890abcdef1234567890abcdef'.split('').shuffle.join
  end
end
# rubocop:disable SpaceAroundOperators
