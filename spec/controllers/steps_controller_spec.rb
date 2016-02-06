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

        context "step 1" do
          let(:attrs) { { step_number: 1 } }
          it { is_expected.to render_template(partial: 'steps/_step1') }

          context "user uploads 1 document" do

          end
        end
      end

      context "user has not been approved" do
        let(:approved) { false }
        it { is_expected.to redirect_to(waiting_for_approval_path) }

      end
    end
  end
end
