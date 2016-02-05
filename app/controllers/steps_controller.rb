class StepsController < ApplicationController
  before_action :require_user

  def index
    if current_user.step_number == 1
      User::STEP_ONE_DOCUMENTS.each do |st|
        # current_user.doc= Document.new unless current_user.doc
        unless current_user.send(st)
          current_user.send((st.to_s+'=').to_sym, Document.new)
        end
      end
    elsif current_user.step_number == 2
      # TODO
    end
  end

  def upload_documents
    if current_user.update_attributes(step_params)
      redirect_to waiting_for_approval_path, alert: "Your documents were uploaded"
    else
      render :index, alert: "Some errors occured"
    end
  end

  protected

  def step_params
    # TODO:
    # 1. check user current_step
    # 2. grab documents for this step only (doc_attributes: [:file], doc_attributes2: [:file],)
    params.require(:user).permit(letter_of_representation_attributes: [:file], payment_verification_attributes: [:file])
  end
end
