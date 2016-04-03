require 'rails_helper'

describe Post do
	context "validations" do
		it { should validate_presence_of(:user_id) }

		it { should validate_presence_of(:content) }
		
		it "applies a default scope to descending order posts" do
    		expect(Post.all.to_sql).to eq Post.all.order(created_at: :desc).to_sql
  		end
	end

	context "associations" do
		it { should belong_to(:user) }
		it { should have_many(:comments).dependent(:destroy) }
	end
end
