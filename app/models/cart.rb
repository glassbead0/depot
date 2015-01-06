class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    product = Product.find(product_id)

    if current_item = line_items.find_by(product_id: product_id)
      current_item.quantity += 1
      current_item.line_item_price += product.price
    else
      current_item = line_items.build(product_id: product.id, product_price: product.price, line_item_price: product.price)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.line_item_price }
  end
end
