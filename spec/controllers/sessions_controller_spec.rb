require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST create" do
    let(:admin) { false }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge( admin: admin )}

    context "with valid credentials" do
      before { post :create, email: jim.email, password: jim.password}
      it { is_expected.to redirect_to(steps_path)  }


      it "sets session" do
        expect(session[:user_id]).to eq(jim.id)
      end

      it "sets flash notice" do
        expect(flash[:notice]).to be_present
      end

      context "with admin credentials" do
        let(:admin) { true }
        it { is_expected.to redirect_to(admin_panel_index_path) }
      end
    end

    context "with invalid credentials" do
      before { post :create, email: jim.email, password: "wrong" }
      it { is_expected.to render_template(:new) }
    end
  end

  describe "DELETE destroy" do
    subject(:response) { delete :destroy }

    context "user is logged in" do
      let(:jim) { Fabricate(:user, first_name: "jim") }
      before { set_current_user(jim) }

      it "sets session[:user_id] to nil" do
        delete :destroy
        expect(session[:user_id]).to be_nil
      end
      context "user is logged out" do
        it { is_expected.to redirect_to(root_path)  }
      end

    end
  end
end

