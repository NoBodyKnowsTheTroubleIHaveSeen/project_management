require 'test_helper'

class BaseInformationControllerTest < ActionController::TestCase
  test "should get notice" do
    get :notice
    assert_response :success
  end

  test "should get relation" do
    get :relation
    assert_response :success
  end

end
