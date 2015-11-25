require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user = User.find(1)
		# This code is not idiomatically correct.
		@micropost = @user.microposts.build(content: "Lorem ipsum", user_id: @user.id)
	end

	test "should be valid" do
		assert @micropost.valid?
	end

	test "user id should be present" do
		@micropost.user_id = nil
		assert_not @micropost.valid?
	end

	test "content should be present" do
    	@micropost.content = "   "
    	assert_not @micropost.valid?
  	end

end
