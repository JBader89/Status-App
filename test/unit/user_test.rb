require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:jeremy).profile_name

	users(:jeremy)

    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name with no spaces" do
    user = User.new
    user.profile_name="A profile_name with spaces"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must be formatted correctly")
  end
end
