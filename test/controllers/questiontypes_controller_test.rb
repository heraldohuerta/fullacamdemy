require 'test_helper'

class QuestiontypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questiontype = questiontypes(:one)
  end

  test "should get index" do
    get questiontypes_url
    assert_response :success
  end

  test "should get new" do
    get new_questiontype_url
    assert_response :success
  end

  test "should create questiontype" do
    assert_difference('Questiontype.count') do
      post questiontypes_url, params: { questiontype: { descripcion: @questiontype.descripcion, tipo: @questiontype.tipo } }
    end

    assert_redirected_to questiontype_url(Questiontype.last)
  end

  test "should show questiontype" do
    get questiontype_url(@questiontype)
    assert_response :success
  end

  test "should get edit" do
    get edit_questiontype_url(@questiontype)
    assert_response :success
  end

  test "should update questiontype" do
    patch questiontype_url(@questiontype), params: { questiontype: { descripcion: @questiontype.descripcion, tipo: @questiontype.tipo } }
    assert_redirected_to questiontype_url(@questiontype)
  end

  test "should destroy questiontype" do
    assert_difference('Questiontype.count', -1) do
      delete questiontype_url(@questiontype)
    end

    assert_redirected_to questiontypes_url
  end
end
