require 'test_helper'

class ManagementControllerTest < ActionController::TestCase
  test "should get plan" do
    get :plan
    assert_response :success
  end

  test "should get task_distribute" do
    get :task_distribute
    assert_response :success
  end

  test "should get task_summary" do
    get :task_summary
    assert_response :success
  end

  test "should get schedule_submit" do
    get :schedule_submit
    assert_response :success
  end

  test "should get schedule_summary" do
    get :schedule_summary
    assert_response :success
  end

end
