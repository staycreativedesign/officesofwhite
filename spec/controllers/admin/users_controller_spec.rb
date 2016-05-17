require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) { false }
  let(:attrs) { {} }
  let(:admin_user) { Fabricate :user, attrs.merge( admin: admin, first_name: "Bob" ) }
  let(:jim) { Fabricate :user, attrs.merge( first_name: "Jim" ) }

  describe "GET index" do
    render_views
    subject(:response) { get :index }
    subject(:make_request) { get :index }

    context "user is logged in" do
      before { set_current_user(admin_user) }
      let(:admin) { true }

      context "user is administrator" do
        it { is_expected.to render_template(:index) }

        it "assigns @users" do
          make_request
          users = assigns[:users]
          expect(users.count).to eql 1
        end
      end
    end
  end

  describe "GET show" do
    render_views
    subject(:response) { get :show, id: jim.id }

    context "user is logged in" do
      before { set_current_user(admin_user) }
      let(:admin) { true }

      context "user is administrator" do
        it { is_expected.to render_template(:show) }
      end
    end
  end

  describe "GET edit" do
    render_views
    subject(:response) { get :edit, id: jim.id }

    context "user is logged in" do
      before { set_current_user(admin_user) }
      let(:admin) { true }

      context "user is administrator" do
        it { is_expected.to render_template(:edit) }
      end
    end
  end

  describe "PATCH update" do
    let(:office) { Fabricate(:office_location) }

    subject(:make_request) { patch :update, id: jim.id, user: { last_name:  "Azazel", office_location_id: office.id } }


    context "user is logged in" do
      before { set_current_user(admin_user) }
      let(:admin) { true }

      context "user is administrator" do
        it "updates jims profile" do
          make_request
          expect(jim.reload.last_name).to eql "Azazel"
        end

        it "updates jims profile with office_location" do
          make_request
          expect(jim.reload.office_location_id).to eql office.id
        end


      end
    end
  end

  describe "POST destroy" do
    subject(:response) { delete :destroy, id: jim.id }
    context "user is logged in" do
      before { set_current_user(admin_user) }
      let(:admin) { true }

      context "user is administrator" do
        it { is_expected.to redirect_to admin_users_path }

        it "deletes the user" do
          expect(User.count).to eql 1
        end
      end
    end
  end
end
