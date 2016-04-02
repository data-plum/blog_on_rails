require 'rails_helper'

describe User do
	it "has a valid factory" do
	    expect(FactoryGirl.create(:user)).to be_valid
	  end

	context "validations" do
	  it { should validate_presence_of(:name) }
	  it { should validate_length_of(:name).is_at_most(50) }

	  it { should validate_presence_of(:email) }
	  it { should validate_length_of(:email).is_at_most(255) }
	  it { should validate_uniqueness_of(:email).case_insensitive }
	  it { should allow_value('foo@bar.com').for(:email) }
  	  it { should_not allow_value('foobar.com').for(:email) }

  	  it { should validate_presence_of(:password) }
  	  it { should validate_length_of(:password).is_at_least(6) }
  	  it { should_not allow_value(nil).for(:password) }
  	  it { should have_secure_password }
	end

	context "associations" do
		it { should have_many(:posts).dependent(:destroy) }
		it { should have_many(:comments).dependent(:destroy) }
		it do
			should have_many(:active_relationships).
			class_name('Relationship').
			with_foreign_key('follower_id').
			dependent(:destroy)
		end
		it do 
			should have_many(:passive_relationships).
			class_name('Relationship').
			with_foreign_key('followed_id').
			dependent(:destroy)
		end
		it do 
			should have_many(:following).
			through(:active_relationships).
			source(:followed)
		end
  	  	it do 
  	  		should have_many(:followers).
  	  		through(:passive_relationships).
  	  	 	source(:follower)
  	  	end
	end
end
