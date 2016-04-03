require 'rails_helper'

describe UsersController do
        
  describe "GET #index" do
    it { should use_before_action(:logged_in_user) }
  end
  
  describe "GET #show" do
  end
  
  describe "GET #new" do
    before { get :new }
    it { should render_template('new') }
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it do
        params = { user: {
                   name: 'John',
                   email: 'johndoe@example.com',
                   password: 'password'}
                  }
        should permit(:name, :email, :password).
        for(:create, params: params).on(:user)
      end
      it { is_expected.to redirect_to :user }
    end
    context "with invalid attributes" do
      # user = FactoryGirl.build(:invalid_user)
      # it { is_expected.to render_template :new }
    end
  end

  describe "GET #edit" do
    it { should use_before_action(:logged_in_user) }
    it { should use_before_action(:correct_user) }
  end

  describe "POST #update" do
    it { should use_before_action(:logged_in_user) }
    it { should use_before_action(:correct_user) }
    
    context "with valid attributes" do
    end
    
    context "with invalid attributes" do
    end
  end

  describe "DELETE #destroy" do
    it { should use_before_action(:admin_user) }
  end

  describe "GET #following" do
    it { should use_before_action(:logged_in_user) }
  end

  describe "GET #followers" do
    it { should use_before_action(:logged_in_user) }
  end
end
