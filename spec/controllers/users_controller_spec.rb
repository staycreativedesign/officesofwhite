require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do
    context "user fills out form correctly" do
      before do
        post :create, user: Fabricate.attributes_for(:user, phone_number_1: "305", phone_number_2: "619", phone_number_3: "3724")
      end
      it "creates a new user" do
        expect(User.count).to equal(1)
      end
      it "sends an email" do
        expect(Sidekiq::Extensions::DelayedMailer.jobs.count).to eq(0)
      end

      it "formats the phone number" do
        expect(User.last.phone_number).to eq("305 - 619 - 3724")
      end
    end
    context "user does not fill out form correctly" do
      before do
        Sidekiq::Extensions::DelayedMailer.jobs.clear
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
      end
      it "does not create user" do
        expect(User.count).to equal(0)
      end
      it "redirects to new" do
        expect(response).to render_template(:new)
      end
      it "does not send email" do
        expect(Sidekiq::Extensions::DelayedMailer.jobs.count).to eq(0)
      end
    end
  end
end
