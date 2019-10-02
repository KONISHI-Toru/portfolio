require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "From", with: @project.from
    fill_in "Hw configuration", with: @project.hw_configuration
    fill_in "Name", with: @project.name
    fill_in "Overview", with: @project.overview
    fill_in "Production url", with: @project.production_url
    fill_in "Sw configuration", with: @project.sw_configuration
    fill_in "Target", with: @project.target
    fill_in "To", with: @project.to
    fill_in "User", with: @project.user_id
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "From", with: @project.from
    fill_in "Hw configuration", with: @project.hw_configuration
    fill_in "Name", with: @project.name
    fill_in "Overview", with: @project.overview
    fill_in "Production url", with: @project.production_url
    fill_in "Sw configuration", with: @project.sw_configuration
    fill_in "Target", with: @project.target
    fill_in "To", with: @project.to
    fill_in "User", with: @project.user_id
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
