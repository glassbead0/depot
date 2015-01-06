class AddProductPriceAndLineItemPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :product_price, :decimal,   precision: 8, scale: 2
    add_column :line_items, :line_item_price, :decimal,  precision: 8, scale: 2
  end
end
