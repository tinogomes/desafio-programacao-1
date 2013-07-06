# encoding: utf-8
# rubocop:disable SpaceAroundOperators

module FacilitySpecHelper
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
end
# rubocop:disable SpaceAroundOperators
