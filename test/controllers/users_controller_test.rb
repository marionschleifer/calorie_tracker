require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @marion = users(:marion)
  end

  test "get new" do
    get :new
    assert_response :success
  end

  test "post unsuccessful create" do
    post :create, user: { name: 'Marion' }
    assert_response :success
  end

  test "post successful create" do
    post :create, user: { name: 'Marion', email: 'marion.schleifer@gmail.com', password: 'hallo123' }
    assert_response :redirect
  end

  test "get edit" do
    session[:user_id] = @marion.id
    get :edit, id: @marion
    assert_response :success
  end

  test "post successful update" do
    post :update, id: @marion
    assert_response :redirect
  end

end
