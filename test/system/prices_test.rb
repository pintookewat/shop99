require 'application_system_test_case'

class PricesTest < ApplicationSystemTestCase
  setup do
    @price = prices(:one)
  end

  test 'visiting the index' do
    visit prices_url
    assert_selector 'h1', text: 'Prices'
  end

  test 'should create price' do
    visit prices_url
    click_on 'New price'

    fill_in 'Active', with: @price.active
    fill_in 'Boolean', with: @price.boolean
    fill_in 'Created', with: @price.created
    fill_in 'Currency', with: @price.currency
    fill_in 'Default price', with: @price.default_price
    fill_in 'Integer', with: @price.integer
    fill_in 'Interval', with: @price.interval
    fill_in 'Interval count', with: @price.interval_count
    fill_in 'Livemode', with: @price.livemode
    fill_in 'Object', with: @price.object
    fill_in 'Payment type', with: @price.payment_type
    fill_in 'Price', with: @price.price_id
    fill_in 'Product', with: @price.product_id
    fill_in 'String', with: @price.string
    click_on 'Create Price'

    assert_text 'Price was successfully created'
    click_on 'Back'
  end

  test 'should update Price' do
    visit price_url(@price)
    click_on 'Edit this price', match: :first

    fill_in 'Active', with: @price.active
    fill_in 'Boolean', with: @price.boolean
    fill_in 'Created', with: @price.created
    fill_in 'Currency', with: @price.currency
    fill_in 'Default price', with: @price.default_price
    fill_in 'Integer', with: @price.integer
    fill_in 'Interval', with: @price.interval
    fill_in 'Interval count', with: @price.interval_count
    fill_in 'Livemode', with: @price.livemode
    fill_in 'Object', with: @price.object
    fill_in 'Payment type', with: @price.payment_type
    fill_in 'Price', with: @price.price_id
    fill_in 'Product', with: @price.product_id
    fill_in 'String', with: @price.string
    click_on 'Update Price'

    assert_text 'Price was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Price' do
    visit price_url(@price)
    click_on 'Destroy this price', match: :first

    assert_text 'Price was successfully destroyed'
  end
end
