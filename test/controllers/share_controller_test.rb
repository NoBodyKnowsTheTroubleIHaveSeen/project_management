require 'test_helper'

class ShareControllerTest < ActionController::TestCase
  test "should get file_share" do
    get :file_share
    assert_response :success
  end

  test "should get question_answer" do
    get :question_answer
    assert_response :success
  end

end
