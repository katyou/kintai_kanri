require 'test_helper'

class WorkKanriControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_kanri_index_url
    assert_response :success
  end

  test "should get show" do
    get work_kanri_show_url
    assert_response :success
  end

  test "should get new" do
    get work_kanri_new_url
    assert_response :success
  end

  test "should get edit" do
    get work_kanri_edit_url
    assert_response :success
  end

end
