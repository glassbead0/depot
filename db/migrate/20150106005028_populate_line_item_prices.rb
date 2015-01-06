class PopulateLineItemPrices < ActiveRecord::Migration
  def up
    LineItem.all.each do |item|
      item.product_price = item.product.price
      item.line_item_price = item.product.price * item.quantity
      item.save!
    end
  end

  def down

  end
end
