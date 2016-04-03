require 'rails_helper'

describe RelationshipsController do

  describe "access control" do
    it "should require signin for create" do
      post :create
      expect(response).to redirect_to(login_path)
    end

    it "should require signin for destroy" do
      delete :destroy, id: 1
      expect(response).to redirect_to(login_path)
    end
  end
end
