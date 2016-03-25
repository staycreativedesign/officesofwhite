require 'rails_helper'

RSpec.describe Admin::PanelController, type: :controller do
  describe "GET index" do
    render_views
    subject(:response) { get :index }

    let(:admin) { false }
    let(:jim) { Fabricate :user, admin: admin }

    context "admin is logged in to panel" do
      before { set_current_user(jim) }
      let(:admin) { true }
      it { is_expected.to render_template(:index) }
    end

    context "user is not admin" do
      before { set_current_user(jim) }
      let(:admin) { false }
      it { is_expected.to redirect_to(login_path) }
    end
  end
end
