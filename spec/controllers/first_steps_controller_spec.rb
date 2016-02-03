require 'rails_helper'

RSpec.describe FirstStepsController, type: :controller do
  describe "GET new" do
    context "when user is not approved" do
      let(:jim) { Fabricate(:user) }

      it "redirects the user to the waiting page" do
        set_current_user(jim)
        get :new, { user_id: jim.id }
        expect(response).to redirect_to waiting_for_approval_path
      end

    end
    context "when user is approved" do
      let(:jim) { Fabricate(:user, approved: true) }

      it "responds with 200" do
        set_current_user(jim)
        get :new, { user_id: jim.id }
        is_expected.to respond_with 200
      end
    end
  end

  describe "POST create" do

  end
end
