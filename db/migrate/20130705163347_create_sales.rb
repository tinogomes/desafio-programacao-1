# encoding: utf-8
# rubocop:disable MethodLength

class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :transaction_key, null: false, limit: 32
      t.decimal :total_price, null: false, precision: 12, scale: 2

      t.timestamps
    end

    add_index :sales, :transaction_key, unique: true

    create_table :sale_items do |t|
      t.integer :sale_id
      t.string :purchaser_name, null: false
      t.string :item_description, null: false
      t.decimal :item_price, null: false, precision: 10, scale: 2
      t.integer :purchase_count, null: false
      t.string :merchant_address, null: false
      t.string :merchant_name, null: false

      t.timestamps
    end

    add_index :sale_items, :sale_id
  end
end
# rubocop:enable MethodLength