# -*- coding: utf-8 -*-

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

end
