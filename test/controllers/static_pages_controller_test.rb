require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

def setup
@titre ="super application"
end

test "should get root_url" do
    get root_url
    assert_response :success
#assert_select "title", "Contact #{@titre}"
  end

test "should get contact" do
    get :contact
    assert_response :success
assert_select "title", "Contact #{@titre}"
  end

test "should get home" do
    get :home
    assert_response :success
assert_select "title", "Home #{@titre}"
  end

    test "toto" do
    get :toto
    assert_response :success
assert_select "title", "Toto #{@titre}"
  end

  test "should get help" do
    get :help
    assert_response :success
assert_select "title", "Help #{@titre}"
  end

  test "should get about" do
    get :about
    assert_response :success
assert_select "title", "About #{@titre}"
  end

end
