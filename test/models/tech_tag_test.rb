require 'test_helper'

class TechTagTest < ActiveSupport::TestCase
  def setup
    @tech_tag = TechTag.new(name: "Tech Tag1",
                            tech_category: TechCategory.new,
                            display_order: 100)
  end

  test "should be valid" do
    assert @tech_tag.valid?
  end

  test "nameは必須" do
    @tech_tag.name = "     "
    assert_not @tech_tag.valid?
  end

  test "nameの長さがカラム幅と等しい場合はOK" do
    @tech_tag.name = "a" * 255
    assert @tech_tag.valid?
  end

  test "nameの長さがカラムを超えるとNG" do
    @tech_tag.name = "a" * 256
    assert_not @tech_tag.valid?
  end

  test "display_orderは必須" do
    @tech_tag.display_order = nil
    assert_not @tech_tag.valid?
  end

  test "display_orderは数値" do
    @tech_tag.display_order = "xxx"
    assert_not @tech_tag.valid?
  end

  test "projectに紐づいているものは削除不可" do
    proj = projects(:proj001)
    @tech_tag.projects.push(proj)
    @tech_tag.save

    assert_not @tech_tag.destroy
    assert_equal 1, @tech_tag.errors.size
    assert_equal "project tech tagsが存在しているので削除できません",
                 @tech_tag.errors.full_messages.first
  end
end
