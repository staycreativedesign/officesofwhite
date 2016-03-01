require 'rails_helper'

RSpec.describe StepsController, type: :controller do
  describe "GET index" do
    render_views
    subject(:response) { get :index }

    let(:approved) { nil }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge( approved: approved, first_name: "jim"  )  }

    context "user is logged in" do
      before { set_current_user(jim) }

      context "user is approved" do
        let(:approved) { true }

        context "step 0" do
          let(:attrs) { { step_number: 0 } }
          it { is_expected.to redirect_to(waiting_for_approval_path) }
        end
        context "step 1" do
          let(:attrs) { { step_number: 1 } }
          it { is_expected.to render_template(partial: 'steps/_step1') }
        end
      end

      context "user has not been approved" do
        let(:approved) { false }

        context "step 0" do
          it { is_expected.to redirect_to(waiting_for_approval_path) }
        end
      end
    end
  end

  describe "PATCH #upload_documents" do
    let(:jim) { Fabricate :user,  approved: true, first_name: "jim", step_number: 1 }

    #FIX need to add user_id
    context "user is logged in" do
      before do
        set_current_user(jim)
        patch :upload_documents,
          {"user" =>
            {
              "letter_of_representation_attributes" =>
                { "file" => Fabricate(:document), "user_id" => jim.id },
              "service_agreement_attributes" =>
                { "file" => Fabricate(:document), "user_id" => jim.id },
             "disclosure_statement_attributes" =>
                { "file" => Fabricate(:document), "user_id" => jim.id }
            }
          }
      end
        it { is_expected.to redirect_to(waiting_for_approval_path) }
    end

  end
end
