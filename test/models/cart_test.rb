require 'test_helper'

class CartTest < ActiveSupport::TestCase
  setup do
    @product = products(:clock)
    @cart = carts(:one)
    @products = [products(:one), products(:two), products(:clock), products(:bus)]
  end

  test '#add_product' do
    assert_difference('@cart.line_items.count') do
      @line_item = @cart.add_product(@product.id)
      @line_item.save
    end

    @cart_line_item = @cart.line_items.first
    assert_equal @cart_line_item.product_id, @product.id
    assert_equal @cart_line_item.product_price, @product.price
  end

  test 'adding multiple products' do
    @products.each_with_index do |product, index|
      (index+1).times do
        li = @cart.add_product(product)
        li.save
      end
    end

    expected_prices = [9.99, 19.98, 120, 400_000]
    assert_equal @cart.line_items.map(&:line_item_price), expected_prices
  end
end
