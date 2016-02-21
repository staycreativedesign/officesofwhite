class StepsController < ApplicationController
  before_action :require_user
  before_action :find_user

  def index
    case @user.find_current_step
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
    if @user.update_attributes(step_params)
      redirect_to waiting_for_approval_path, alert: "Your documents were uploaded"
      @user.update_attributes(step_number: 0)
    else
      render :index, alert: "Some errors occured please re-upload your documents"
    end
  end


  def find_user
    @user = current_user
  end

  def step_params
    hash = Hash.new
    @user.set_documents.each do |document|
      hash[:"#{document}_attributes"] = [:file]
    end
    params.require(:user).permit(hash)
  end

  def find_documents_for_step(step_documents)
    step_documents.each do |st|
      unless @user.send(st)
        @user.send((st.to_s+'=').to_sym, Document.new)
      end
    end
  end
end
