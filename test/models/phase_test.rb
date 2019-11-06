require 'test_helper'

class PhaseTest < ActiveSupport::TestCase
  def setup
    @phase = Phase.new(name: "Phase1",
                       display_order: 100)
  end

  test "should be valid" do
    assert @phase.valid?
  end

  test "nameは必須" do
    @phase.name = "     "
    assert_not @phase.valid?
  end

  test "nameの長さがカラム幅と等しい場合はOK" do
    @phase.name = "a" * 255
    assert @phase.valid?
  end

  test "nameの長さがカラムを超えるとNG" do
    @phase.name = "a" * 256
    assert_not @phase.valid?
  end

  test "display_orderは必須" do
    @phase.display_order = nil
    assert_not @phase.valid?
  end

  test "display_orderは数値" do
    @phase.display_order = "xxx"
    assert_not @phase.valid?
  end

  test "projectに紐づいているものは削除不可" do
    proj = projects(:proj001)
    @phase.projects.push(proj)
    @phase.save

    assert_not @phase.destroy
    assert_equal 1, @phase.errors.size
    assert_equal "project phasesが存在しているので削除できません",
                 @phase.errors.full_messages.first
  end
end
