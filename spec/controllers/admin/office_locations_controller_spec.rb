require "rails_helper"

RSpec.describe Admin::OfficeLocationsController do
  let(:admin) { false }
  let(:attrs) { {} }
  let(:admin_user) { Fabricate :user, attrs.merge( admin: admin, first_name: "Bob" ) }
  let(:office) { Fabricate(:office_location) }

  describe 'GET index' do
    render_views
    subject(:response) { get :index }

    let(:admin) { nil }
    let(:attrs) { {} }
    let(:admin_user) { Fabricate :user, attrs.merge(admin: admin) }

    context "user is logged in" do
      before { set_current_user(admin_user) }

      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to render_template :index }

        it "assigns @office_locations" do
          response
          first_office = Fabricate(:office_location)
          expect(assigns(:office_locations)).to eq([first_office])
        end
      end
    end
  end

  describe 'GET new' do
    render_views
    subject(:response) { get :new }

    context "user is logged in" do

      before { set_current_user(admin_user) }

      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to render_template :new }
      end
    end
  end

  describe 'POST create' do
    render_views
    subject(:request) { post :create, office_location: Fabricate.attributes_for(:office_location)  }
    context "user is logged in" do
      before { set_current_user(admin_user) }

      context "user is admin" do
        let(:admin) { true }

        context "admin creates new office location" do
          it { is_expected.to redirect_to admin_office_locations_path }

          it "adds another office location" do
            request
            expect(OfficeLocation.count).to eql 1
          end
        end
      end
    end
  end

  describe 'GET edit' do
    render_views
    subject(:request) { get :edit, id: office.id }
    context "user is logged in" do
      before { set_current_user(admin_user) }

      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to render_template(:edit) }

      end
    end
  end

  describe 'PATCH update' do
    subject(:response) { patch :update, id: office.id, office_location: { name: "Boo Boo" }  }
    context "user is logged in" do
      before do
        set_current_user(admin_user)
      end
      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to redirect_to admin_office_locations_path }
        it "updates the office location" do
          response
          expect(office.reload.name).to eql "Boo Boo"
        end
      end
    end
  end

  describe 'DELETE destroy' do
    subject(:request) { delete :destroy, id: office.id }
    context "user is logged in" do
      before { set_current_user(admin_user) }

      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to redirect_to admin_office_locations_path }

        it "deletes office location" do
          request
          expect(OfficeLocation.count).to eql(0)
        end
      end
    end
  end
end
