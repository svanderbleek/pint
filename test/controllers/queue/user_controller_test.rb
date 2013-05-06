require 'test_helper'

class Queue::UserControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
