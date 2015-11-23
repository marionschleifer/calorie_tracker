require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @eggnog = entries(:eggnog)
    @marion = users(:marion)
  end

  test "get index without being logged in" do
    get :index
    assert_response :redirect
  end

  test "post create" do
    post :create, entry: { food: 'String Cheese', calories: 200 }
    assert_response :redirect
  end

  test "delete destroy" do
    delete :destroy, id: @eggnog
    assert_response :redirect
  end
end
