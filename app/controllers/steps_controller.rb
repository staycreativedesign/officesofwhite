class StepsController < ApplicationController
  before_action :require_user

  def index
    case current_step
    when nil
      redirect_to new_user_path
    when 0
      redirect_to waiting_for_approval_path
    when 1
      step_one
    end
  end

  def step_one
    @header = "bg-index"

    find_documents_for_step(User::STEP_ONE_DOCUMENTS)
  end

  def upload_documents
    if current_user.update_attributes(step_params)
      redirect_to waiting_for_approval_path, alert: "Your documents were uploaded"
    else
      render :index, alert: "Some errors occured"
    end
  end


  def step_params
    #
    # TODO:
    # 1. check user current_step
    # created a method to what step the current_user is on called current_step
    # 2. grab documents for this step only (doc_attributes: [:file], doc_attributes2: [:file],)
    case current_step
    when 1
      binding.pry
      params.require(:user).permit(letter_of_representation_attributes: [:file], payment_verification_attributes: [:file])
    when 2
      params.require(:user).permit(foo_attributes: [:file], bar: [:file], baz: [:file])
    end
  end

  def current_step
    current_user.step_number
  end
  def find_documents_for_step(step_documents)
    step_documents.each do |st|
      # current_user.doc= Document.new unless current_user.doc
      unless current_user.send(st)
        current_user.send((st.to_s+'=').to_sym, Document.new)
      end
    end
  end
end
