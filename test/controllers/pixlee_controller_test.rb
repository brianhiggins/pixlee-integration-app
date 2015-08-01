require 'test_helper'

class PixleeControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get createToken" do
    get :createToken
    assert_response :success
  end

  test "should get getToken" do
    get :getToken
    assert_response :success
  end

end
