require 'application_system_test_case'

class QrcodesTest < ApplicationSystemTestCase
  setup do
    @qrcode = qrcodes(:one)
  end

  test 'visiting the index' do
    visit qrcodes_url
    assert_selector 'h1', text: 'Qrcodes'
  end

  test 'should create qrcode' do
    visit qrcodes_url
    click_on 'New qrcode'

    fill_in 'Image', with: @qrcode.image
    fill_in 'Location', with: @qrcode.location
    fill_in 'Name', with: @qrcode.name
    click_on 'Create Qrcode'

    assert_text 'Qrcode was successfully created'
    click_on 'Back'
  end

  test 'should update Qrcode' do
    visit qrcode_url(@qrcode)
    click_on 'Edit this qrcode', match: :first

    fill_in 'Image', with: @qrcode.image
    fill_in 'Location', with: @qrcode.location
    fill_in 'Name', with: @qrcode.name
    click_on 'Update Qrcode'

    assert_text 'Qrcode was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Qrcode' do
    visit qrcode_url(@qrcode)
    click_on 'Destroy this qrcode', match: :first

    assert_text 'Qrcode was successfully destroyed'
  end
end
