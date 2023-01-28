require "application_system_test_case"

class DsTest < ApplicationSystemTestCase
  setup do
    @d = ds(:one)
  end

  test "visiting the index" do
    visit ds_url
    assert_selector "h1", text: "Ds"
  end

  test "should create d" do
    visit ds_url
    click_on "New d"

    fill_in "Active", with: @d.active
    fill_in "Boolean", with: @d.boolean
    fill_in "Created", with: @d.created
    fill_in "Currency", with: @d.currency
    fill_in "Default price", with: @d.default_price
    fill_in "Integer", with: @d.integer
    fill_in "Interval", with: @d.interval
    fill_in "Interval count", with: @d.interval_count
    fill_in "Livemode", with: @d.livemode
    fill_in "Object", with: @d.object
    fill_in "Payment type", with: @d.payment_type
    fill_in "Price", with: @d.price_id
    fill_in "Product", with: @d.product_id
    fill_in "String", with: @d.string
    click_on "Create D"

    assert_text "D was successfully created"
    click_on "Back"
  end

  test "should update D" do
    visit d_url(@d)
    click_on "Edit this d", match: :first

    fill_in "Active", with: @d.active
    fill_in "Boolean", with: @d.boolean
    fill_in "Created", with: @d.created
    fill_in "Currency", with: @d.currency
    fill_in "Default price", with: @d.default_price
    fill_in "Integer", with: @d.integer
    fill_in "Interval", with: @d.interval
    fill_in "Interval count", with: @d.interval_count
    fill_in "Livemode", with: @d.livemode
    fill_in "Object", with: @d.object
    fill_in "Payment type", with: @d.payment_type
    fill_in "Price", with: @d.price_id
    fill_in "Product", with: @d.product_id
    fill_in "String", with: @d.string
    click_on "Update D"

    assert_text "D was successfully updated"
    click_on "Back"
  end

  test "should destroy D" do
    visit d_url(@d)
    click_on "Destroy this d", match: :first

    assert_text "D was successfully destroyed"
  end
end
