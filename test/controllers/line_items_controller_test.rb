require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = products(:apple)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:ruby).id
    end

    assert_redirected_to cart_path(assigns(:line_item).cart)
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { product_id: @line_item.product_id }

    assert_redirected_to line_item_path(assigns(:line_item))
  end
end
