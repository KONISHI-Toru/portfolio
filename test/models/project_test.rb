require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "projectに紐づいているものは削除不可" do
    proj = projects(:proj001)
    assert_equal 2, proj.tech_tags.size
    relations = ProjectTechTag.where(project_id: proj.id)
    assert_equal 2, relations.size

    assert proj.destroy
    relations = ProjectTechTag.where(project_id: proj.id)
    assert_equal 0, relations.size
  end
end
