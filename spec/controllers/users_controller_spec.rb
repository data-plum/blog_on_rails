require 'rails_helper'

describe UsersController do

              
  describe "GET #index" do
    it "populates an array of users"
    it "renders the :index view"
  end
  
  describe "GET #show" do
    it "assigns the requested user to @user"
    it "assigns the current user posts to @posts"
    it "renders the :show template"
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
    it "assigns a existed user from db to @user"
    it "renders the :edit template"
  end

  describe "POST #update" do
    context "with valid attributes" do
      it "saves the user changes in the database"
      it "redirects to the @user page"
    end
    
    context "with invalid attributes" do
      it "does not save the user changes in the database"
      it "re-renders the :edit template"
    end
  end

  describe "DELETE #destroy" do
    it "find the user in the database"
    it "redirects to users page"
    end
end