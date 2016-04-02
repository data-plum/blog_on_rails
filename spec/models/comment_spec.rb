require 'rails_helper'

describe Comment do
	context "validations" do
		it { should validate_presence_of(:user_id) }
		it { should validate_presence_of(:post_id) }

		it { should validate_presence_of(:content) }
		it { should validate_length_of(:content).is_at_most(140) }
	end

	context "associations" do
		it { should belong_to(:user) }
		it { should belong_to(:post) }
	end
end
