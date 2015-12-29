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
    assert_equal(@pizza, Entry.where(user_id: @marion.id)[0])
    assert_equal(@champagne, Entry.where(user_id: @marion.id)[1])
    assert_equal(@pudding, Entry.where(user_id: @marion.id)[2])
    assert_equal(@enchiladas, Entry.where(user_id: @marion.id)[3])
    assert_equal(@eggnog, Entry.where(user_id: @marion.id)[4])
    # puts Entry.where(user_id: @marion.id).pluck(:position).inspect
  end
end
