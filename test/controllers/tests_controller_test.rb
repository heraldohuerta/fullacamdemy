require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get tests" do
    get tests_tests_url
    assert_response :success
  end

  test "should get questiontests" do
    get tests_questiontests_url
    assert_response :success
  end

  test "should get questiontypes" do
    get tests_questiontypes_url
    assert_response :success
  end

end
