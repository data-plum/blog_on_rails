require 'rails_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      expect(response).to be_success
    end
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = { email: "", password: "" }
      end
      
      it "should re-render the new page" do
        post :create, session: @attr
        expect(response).to render_template('new')
      end
    end
  end
end
