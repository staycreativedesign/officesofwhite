require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe "GET index" do
    render_views
    subject(:response) { get :index }
    subject(:make_request) { get :index }

    let(:admin) { false }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge( admin: admin, first_name: "Jim" ) }

    context "user is logged in" do
      before { set_current_user(jim) }

      context "user is administrator" do
        let(:admin) { true }
        it { is_expected.to render_template(:index) }

        it "assigns @users" do
          make_request
          expect(assigns[:users]).to eq [jim]
        end
        # check to to see if @users is assigned to all users
      end


      context "user is not administrator" do
        let(:admin) { false }
        it { is_expected.to redirect_to(login_path)  }
      end

    end
  end
end
