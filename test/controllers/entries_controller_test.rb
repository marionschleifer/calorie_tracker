require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @eggnog = entries(:eggnog)
    @marion = users(:marion)
  end

  test "get index without being logged in" do
    get :index
    assert_response :redirect
  end

  # test "post unsuccessfull create" do
  #   post :create, user: @marion, entry: { food: 'String Cheese' }
  #   assert_response :success
  # end

  # test "get destroy" do
  #   get :destroy
  #   assert_response :success
  # end
end