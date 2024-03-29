require 'test_helper'

class PricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price = prices(:one)
  end

  test 'should get index' do
    get prices_url
    assert_response :success
  end

  test 'should get new' do
    get new_price_url
    assert_response :success
  end

  test 'should create price' do
    assert_difference('Price.count') do
      post prices_url,
           params: { price: { active: @price.active, boolean: @price.boolean, created: @price.created, currency: @price.currency,
                              default_price: @price.default_price, integer: @price.integer, interval: @price.interval, interval_count: @price.interval_count, livemode: @price.livemode, object: @price.object, payment_type: @price.payment_type, price_id: @price.price_id, product_id: @price.product_id, string: @price.string } }
    end

    assert_redirected_to price_url(Price.last)
  end

  test 'should show price' do
    get price_url(@price)
    assert_response :success
  end

  test 'should get edit' do
    get edit_price_url(@price)
    assert_response :success
  end

  test 'should update price' do
    patch price_url(@price),
          params: { price: { active: @price.active, boolean: @price.boolean, created: @price.created, currency: @price.currency,
                             default_price: @price.default_price, integer: @price.integer, interval: @price.interval, interval_count: @price.interval_count, livemode: @price.livemode, object: @price.object, payment_type: @price.payment_type, price_id: @price.price_id, product_id: @price.product_id, string: @price.string } }
    assert_redirected_to price_url(@price)
  end

  test 'should destroy price' do
    assert_difference('Price.count', -1) do
      delete price_url(@price)
    end

    assert_redirected_to prices_url
  end
end
