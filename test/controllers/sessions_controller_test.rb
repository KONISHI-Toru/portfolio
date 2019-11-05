require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログイン画面が返されること" do
    get login_url
    assert_response :success
  end

  test "ログインできること" do
    post login_url, params: { session: { email: "test1@test.com", password: "testpass1" } }
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal session[:user], users(:test1)
  end

  test "ログインに失敗すること" do
    post login_url, params: { session: { email: "test1@test.com", password: "xxx" } }
    assert_response :success
    assert session[:user].nil?
  end
  
  test "ログアウトしたらログイン画面にリダイレクトされること" do
    post login_url, params: { session: { email: "test1@test.com", password: "testpass1" } }

    delete logout_url
    assert_response :redirect
    assert_redirected_to login_url
    assert session[:user].nil?
  end
end
