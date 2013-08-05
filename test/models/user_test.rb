require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do 
  	@user = FactoryGirl.create :user
  end

  test "user needs a name" do
  	@user.name = ""

  	assert !@user.save
	end

	test "user needs an email" do
		@user.email = ""

  	assert !@user.save
	end

	test "user needs a VALID email" do
		@user.email = "test"

  	assert !@user.save
	end

	test "user needs a password" do
		@user2 = User.new
		@user2.name = "hihihi"
		@user2.email = "test@test.com"
		@user2.password = ""

		assert !@user2.save
	end

	test "cannot have duplicate emails" do
		@user3 = FactoryGirl.build :user

		assert !@user3.save
	end

	test "authenticates with valid pw" do
		assert @user.authenticate("password")
	end

	test "user can progress on a learning path" do
		@learning_path = FactoryGirl.create :learning_path
	end
end
