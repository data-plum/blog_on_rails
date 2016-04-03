require 'rails_helper'

describe Relationship do
	context "valodation" do
		it { should validate_presence_of(:follower_id) }
		it { should validate_presence_of(:followed_id) }
	end

	context "associations" do
		it { should belong_to(:follower).class_name('User') }
		it { should belong_to(:followed).class_name('User') }
	end
end
