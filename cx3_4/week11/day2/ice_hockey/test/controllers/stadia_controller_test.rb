require 'test_helper'

class StadiaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stadia_index_url
    assert_response :success
  end

end
