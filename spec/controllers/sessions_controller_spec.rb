require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET destroy" do
    context "user clicks logout" do
      before do
        jim = Fabricate(:user, first_name: "jim")
        set_current_user(jim)
      end
      it "sets the session[:user_id] to nil" do
        get :destroy
        expect(session[:user_id]).to be_nil
      end
      it "redirects to root_path" do
        get :destroy
        expect(response).to redirect_to root_path
      end
    end

  end
end

