require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  def setup
    @role = Role.new(name: "Role1",
                     display_order: 100)
  end

  test "should be valid" do
    assert @role.valid?
  end

  test "nameは必須" do
    @role.name = "     "
    assert_not @role.valid?
  end

  test "nameの長さがカラム幅と等しい場合はOK" do
    @role.name = "a" * 255
    assert @role.valid?
  end

  test "nameの長さがカラムを超えるとNG" do
    @role.name = "a" * 256
    assert_not @role.valid?
  end

  test "display_orderは必須" do
    @role.display_order = nil
    assert_not @role.valid?
  end

  test "display_orderは数値" do
    @role.display_order = "xxx"
    assert_not @role.valid?
  end

  test "projectに紐づいているものは削除不可" do
    proj = projects(:proj001)
    @role.projects.push(proj)
    @role.save

    assert_not @role.destroy
    assert_equal 1, @role.errors.size
    assert_equal "project rolesが存在しているので削除できません",
                 @role.errors.full_messages.first
  end
end
