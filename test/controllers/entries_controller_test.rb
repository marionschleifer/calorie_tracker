require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @marion = users(:marion)
    @eggnog = entries(:eggnog)
    @pizza = entries(:pizza)
    @champagne = entries(:champagne)
    @pudding = entries(:pudding)
    @enchiladas = entries(:enchiladas)
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

  test "post sort" do
    session[:user_id] = @marion.id
    post :sort, entry_ids: [@pizza, @champagne, @pudding, @enchiladas, @eggnog]
    assert_equal 1, @pizza.reload.position
    assert_equal 2, @champagne.reload.position
    assert_equal 3, @pudding.reload.position
    assert_equal 4, @enchiladas.reload.position
    assert_equal 5, @eggnog.reload.position
  end
end
