require 'rails_helper'

RSpec.describe Admin::PanelController, type: :controller do
  render_views
  describe "GET index" do
    subject(:response) { get :index }
    subject(:make_request) { get :index }

    let(:admin) { false }
    let(:jim) { Fabricate :user, admin: admin }

    context "admin is logged in to panel" do
      before { set_current_user(jim) }
      let(:admin) { true }
      it { is_expected.to render_template(:index) }

      it "assigns @users" do
        make_request
        users = assigns[:users]
        expect(users.count).to eql 1
        expect(users.first.id).to eql jim.id
      end

      it "assigns @total_payments_received" do
        2.times { create_paid_receipt_item(jim, jim.receipts.first, "20.00", true) }
        make_request
        total_payments_received = assigns[:total_payments_received]
        binding.pry
        expect(ReceiptItem.count).to eql 2
        expect(total_payments_received).to eql 40.00
      end

      it "assigns @total_payments_pending"
    end

    context "user is not admin" do
      before { set_current_user(jim) }
      let(:admin) { false }
      it { is_expected.to redirect_to(login_path) }
    end
  end
end
