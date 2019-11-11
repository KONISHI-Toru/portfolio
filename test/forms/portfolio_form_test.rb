require 'test_helper'

class PortfolioFormTest < ActiveSupport::TestCase
  test "公開分のみ取得" do
    @form = PortfolioForm.new
    @form.user_id = users(:test1).id
    results = @form.search
    assert_equal 54, results.length
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

  test "開始時期の新しいもの順に取得" do
    @form = PortfolioForm.new
    @form.user_id = users(:test1).id
    results = @form.search
    assert_equal 54, results.length
    current_from = Time.zone.today
    current_to = Time.zone.today
    results.each do |proj|
      assert proj.from <= current_from
      assert proj.to <= current_to if proj.from == current_from
      current_from = proj.from
      current_to = proj.to
    end
  end

  test "指定された件数分のみ取得" do
    @form = PortfolioForm.new
    @form.user_id = users(:test1).id
    @form.count = 5
    results = @form.search
    assert_equal 5, results.length
    results.each do |proj|
      assert proj.published
    end
  end

  test "全権指定取得" do
    @form = PortfolioForm.new
    @form.user_id = users(:test1).id
    @form.count = -1
    results = @form.search
    assert_equal 54, results.length
    results.each do |proj|
      assert proj.published
    end
  end
end
