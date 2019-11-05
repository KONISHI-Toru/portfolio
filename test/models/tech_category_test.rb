# -*- coding: utf-8 -*-

require 'test_helper'

class TechCategoryTest < ActiveSupport::TestCase
  def setup
    @tech_category = TechCategory.new(name: "Tech Category1",
                                      display_order: 100)
  end

  test "should be valid" do
    assert @tech_category.valid?
  end

  test "nameは必須" do
    @tech_category.name = "     "
    assert_not @tech_category.valid?
  end

  test "nameの長さがカラム幅と等しい場合はOK" do
    @tech_category.name = "a" * 255
    assert @tech_category.valid?
  end

  test "nameの長さがカラムを超えるとNG" do
    @tech_category.name = "a" * 256
    assert_not @tech_category.valid?
  end

  test "display_orderは必須" do
    @tech_category.display_order = nil
    assert_not @tech_category.valid?
  end

  test "display_orderは数値" do
    @tech_category.display_order = "xxx"
    assert_not @tech_category.valid?
  end
end
