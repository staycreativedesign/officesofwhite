require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do
    context "user fills out form correctly" do
      it "creates a new user" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(User.count).to equal(1)
      end
      it "sends an email" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(ActionMailer::Base.deliveries.count).to equal(2)
      end
    end
    context "user does not fill out form correctly" do
      it "does not create user" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
        expect(User.count).to equal(0)
      end
      it "redirects to new" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
        expect(response).to render_template(:new)
      end
    end
  end
end
