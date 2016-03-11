require 'rails_helper'

RSpec.describe ReceiptsController, type: :controller do
  describe "GET index" do
    subject { get :index, user_id: jim.id }

    let(:jim) { Fabricate :user, approved: true, first_name: "Jim" }

    context "user is logged in" do
      before do
        set_current_user(jim)
        create_receipt(jim)
      end

      it "renders the index template" do
        expect(subject).to render_template(:index)
      end
      it "shows all receipts for current_user" do
        expect(jim.receipts.count).to eq(1)
      end
    end
  end

  describe "GET show" do
    let(:jim) { Fabricate :user, approved: true, first_name: "Jim" }

    context "user is logged in" do

      before do
        set_current_user(jim)
        create_receipt(jim)
        create_receipt_item(jim)
      end
    end
  end
end
