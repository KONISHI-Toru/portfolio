require 'test_helper'

class PortfolioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get portfolio_index_url
    assert_response :success
    assert_select "title", "ポートフォリオ"
  end

  test "should get show" do
    get portfolio_show_url, params: { portfolio_form: { user_id: users(:test1).id } }
    assert_response :success
    assert_select "title", "ポートフォリオ"
  end

  test "invalid user id" do
    get portfolio_show_url, params: { portfolio_form: { user_id: 9999 } }
    assert_response :success
    assert_not flash.empty?
    assert_equal flash[:danger], '不正な処理が実行されました。'
    assert_select "title", "ポートフォリオ"
  end
  
end
