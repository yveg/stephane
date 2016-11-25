require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
  get :new
#get "/users/:new" => "new#show"
    assert_response :success
  end



end
