# -*- coding: utf-8 -*-

require 'test_helper'

class PortfolioFormTest < ActiveSupport::TestCase
  test "公開分のみ取得" do
    @form = PortfolioForm.new
    @form.user_id = users(:test1).id
    results = @form.search
    assert_equal 2, results.length
    results.each do |proj|
      assert proj.published
    end
  end

  test "技術タグ指定で取得" do
    @form = PortfolioForm.new
    @form.user_id = users(:test1).id
    @form.tech_tag_ids = [tech_tags(:tech_tag1).id, tech_tags(:tech_tag3).id]
    results = @form.search
    assert_equal 1, results.length
    results.each do |proj|
      assert proj.tech_tags.include?(tech_tags(:tech_tag1)) || proj.tech_tags.include?(tech_tags(:tech_tag3))
    end
  end
end
