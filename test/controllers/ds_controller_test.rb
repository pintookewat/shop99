require "test_helper"

class DsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @d = ds(:one)
  end

  test "should get index" do
    get ds_url
    assert_response :success
  end

  test "should get new" do
    get new_d_url
    assert_response :success
  end

  test "should create d" do
    assert_difference("D.count") do
      post ds_url, params: { d: { active: @d.active, boolean: @d.boolean, created: @d.created, currency: @d.currency, default_price: @d.default_price, integer: @d.integer, interval: @d.interval, interval_count: @d.interval_count, livemode: @d.livemode, object: @d.object, payment_type: @d.payment_type, price_id: @d.price_id, product_id: @d.product_id, string: @d.string } }
    end

    assert_redirected_to d_url(D.last)
  end

  test "should show d" do
    get d_url(@d)
    assert_response :success
  end

  test "should get edit" do
    get edit_d_url(@d)
    assert_response :success
  end

  test "should update d" do
    patch d_url(@d), params: { d: { active: @d.active, boolean: @d.boolean, created: @d.created, currency: @d.currency, default_price: @d.default_price, integer: @d.integer, interval: @d.interval, interval_count: @d.interval_count, livemode: @d.livemode, object: @d.object, payment_type: @d.payment_type, price_id: @d.price_id, product_id: @d.product_id, string: @d.string } }
    assert_redirected_to d_url(@d)
  end

  test "should destroy d" do
    assert_difference("D.count", -1) do
      delete d_url(@d)
    end

    assert_redirected_to ds_url
  end
end
