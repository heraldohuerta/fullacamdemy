require 'test_helper'

class IniciosControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get inicios_Index_url
    assert_response :success
  end

end
