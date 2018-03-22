require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get contacts_get_url
    assert_response :success
  end

end
