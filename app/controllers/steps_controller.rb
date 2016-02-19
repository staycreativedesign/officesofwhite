class StepsController < ApplicationController
  before_action :require_user

  def index
    case current_user.find_current_step
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
    hash = Hash.new
    User::STEP_ONE_DOCUMENTS.each do |document|
      hash[:"#{document}_attributes"] = [:file]
    end
    params.require(:user).permit(hash)
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
