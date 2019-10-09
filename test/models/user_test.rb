require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User",
                     email: "user@example.com",
                     password: "password",
                     password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "published only" do
    published_user = User.new(name: "Published User",
                     email: "published@example.com",
                     password: "password",
                     password_confirmation: "password",
                     published: true)

    unpublished_user = User.new(name: "Unpublished User",
                     email: "unpublished@example.com",
                     password: "password",
                     password_confirmation: "password")
    published_user.save
    unpublished_user.save
    
    result = User.published
    assert_equal 1, result.length
    result.each do |user|
      assert user.published?
    end
  end
end
