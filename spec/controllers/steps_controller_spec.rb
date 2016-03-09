require 'rails_helper'

RSpec.describe StepsController, type: :controller do
  describe "GET index" do
    render_views
    subject(:response) { get :index }

    let(:approved) { nil }
    let(:attrs) { {} }
    let(:jim) { Fabricate :user, attrs.merge( approved: approved, first_name: "Jim"  )  }

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
    let(:attrs) { {} }
    let(:documents) { {} }
    let(:jim) { Fabricate :user, attrs.merge( approved: true, first_name: "Jim" ) }
    let(:user_docs) { { user: documents } }

    subject(:response) { patch :upload_documents, user_docs }

    before { set_current_user(jim) }

    shared_examples "waiting_for_approval" do
      it { is_expected.to redirect_to(waiting_for_approval_path) }
    end

    context "step 1 documents" do
      let(:attrs) { { step_number: 1 } }
      let(:documents) do
        {
          "letter_of_representation_attributes" => { "file" => Fabricate.build(:document).file, "user_id" => jim.id },
          "service_agreement_attributes"    => { "file" => Fabricate.build(:document).file, "user_id" => jim.id },
          "disclosure_statement_attributes" => { "file" => Fabricate.build(:document).file, "user_id" => jim.id }
        }
      end
      it_behaves_like "waiting_for_approval"
    end

    context "step 3 documents" do
      let(:attrs) { { step_number: 3 } }
      let(:documents) do
        {
          "id_and_social_attributes"    => { "file" => Fabricate.build(:document).file, "user_id" => jim.id },
          "first_utility_attributes"    => { "file" => Fabricate.build(:document).file, "user_id" => jim.id },
          "second_utility_attributes"   => { "file" => Fabricate.build(:document).file, "user_id" => jim.id }
        }
      end
      it_behaves_like "waiting_for_approval"
    end

    context "step 4 documents" do
      let(:attrs) { { step_number: 4 } }
      let(:documents) do
        {
          "police_affidavit_attributes" => { "file" => Fabricate.build(:document).file, "user_id" => jim.id },
          "police_report_attributes"    => { "file" => Fabricate.build(:document).file, "user_id" => jim.id }
        }
      end
      it_behaves_like "waiting_for_approval"
    end

  end
end
