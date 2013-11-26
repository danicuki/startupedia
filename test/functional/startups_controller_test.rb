require 'test_helper'

class StartupsControllerTest < ActionController::TestCase
  setup do
    @startup = startups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:startups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create startup" do
    assert_difference('Startup.count') do
      post :create, startup: { blog_feed_url: @startup.blog_feed_url, blog_url: @startup.blog_url, category: @startup.category, city: @startup.city, country: @startup.country, details_url: @startup.details_url, email: @startup.email, founding_date: @startup.founding_date, homepage_url: @startup.homepage_url, linkedin_url: @startup.linkedin_url, name: @startup.name, number_of_employees: @startup.number_of_employees, phone: @startup.phone, short_description: @startup.short_description, state: @startup.state, twitter_username: @startup.twitter_username }
    end

    assert_redirected_to startup_path(assigns(:startup))
  end

  test "should show startup" do
    get :show, id: @startup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @startup
    assert_response :success
  end

  test "should update startup" do
    put :update, id: @startup, startup: { blog_feed_url: @startup.blog_feed_url, blog_url: @startup.blog_url, category: @startup.category, city: @startup.city, country: @startup.country, details_url: @startup.details_url, email: @startup.email, founding_date: @startup.founding_date, homepage_url: @startup.homepage_url, linkedin_url: @startup.linkedin_url, name: @startup.name, number_of_employees: @startup.number_of_employees, phone: @startup.phone, short_description: @startup.short_description, state: @startup.state, twitter_username: @startup.twitter_username }
    assert_redirected_to startup_path(assigns(:startup))
  end

  test "should destroy startup" do
    assert_difference('Startup.count', -1) do
      delete :destroy, id: @startup
    end

    assert_redirected_to startups_path
  end
end
