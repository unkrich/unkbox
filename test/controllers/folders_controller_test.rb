require 'test_helper'

class FoldersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get folders_new_url
    assert_response :success
  end

  test "should get create" do
    get folders_create_url
    assert_response :success
  end

end
