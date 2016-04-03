require 'rails_helper'

describe UsersController do
        
  describe "GET #index" do
    it { should use_before_action(:logged_in_user) }
  end
  
  describe "GET #show" do

    let(:params) do
        { 
         user: {
            name: 'John',
            email: 'johndoe@example.com',
            password: 'password'
         }
        }
    end
  end
  
  describe "GET #new" do
    before { get :new }
    it { should render_template('new') }
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      let(:params) do
        { 
         user: {
            name: 'John',
            email: 'johndoe@example.com',
            password: 'password'
         }
        }
      end
      it 'creates user' do
        is_expected.to permit(:name, :email, :password)
          .for(:create, params: params)
          .on(:user)

        expect(User.count).to eq 1

        user = User.first
        expect(user.name).to eq 'John'
        expect(user.email).to eq 'johndoe@example.com'

        is_expected.to redirect_to user_path(user)
      end
    end

    context "with invalid attributes" do
      let(:params) do
        { 
          user: {
            name: '',
            email: '',
            password: ''
          }
        }
      end

      it 'does not create user' do
        is_expected.to permit(:name, :email, :password)
          .for(:create, params: params)
          .on(:user)

        expect(User.count).to eq 0

        is_expected.to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it { should use_before_action(:logged_in_user) }
    it { should use_before_action(:correct_user) } 
  end

  describe "POST #update" do
    it { should use_before_action(:logged_in_user) }
    it { should use_before_action(:correct_user) }
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
