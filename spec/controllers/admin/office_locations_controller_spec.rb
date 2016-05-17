require "rails_helper"

RSpec.describe Admin::OfficeLocationsController do
  describe 'GET index' do
    render_views
    subject(:response) { get :index }

    let(:admin) { nil }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge(admin: admin) }

    context "user is logged in" do
      before { set_current_user(jim) }

      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to render_template :index }
      end
    end
  end

  describe 'GET new' do
    render_views
    subject(:response) { get :new }
    let(:admin) { nil }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge(admin: admin) }

    context "user is logged in" do

      before { set_current_user(jim) }

      context "user is admin" do
        let(:admin) { true }
        it { is_expected.to render_template :new }
      end
    end
  end

  describe 'POST create' do
    render_views
    let(:admin) { nil }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge(admin: admin) }
    let(:office) { Fabricate.attributes_for(:office_location) }
    subject(:response) { post :create, office_location: office }
    subject(:make_request) { post :create, office_location: office }

    context "user is logged in" do
      before { set_current_user(jim) }

      context "user is admin" do
        let(:admin) { true }

        context "admin creates new office location" do
          it { is_expected.to redirect_to admin_office_locations_path }

          it "adds another office location" do
            make_request
            expect(OfficeLocation.count).to eql 1
          end
        end
      end
    end
  end
end