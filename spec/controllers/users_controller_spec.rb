require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do
    context "user fills out form correctly" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end
      it "creates a new user" do
        expect(User.count).to equal(1)
      end
      it "sends an email" do
        expect(ActionMailer::Base.deliveries).to_not be_empty
      end
    end
    context "user does not fill out form correctly" do
      before do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
      end
      it "does not create user" do
        expect(User.count).to equal(0)
      end
      it "redirects to new" do
        expect(response).to render_template(:new)
      end
    end
  end
end
