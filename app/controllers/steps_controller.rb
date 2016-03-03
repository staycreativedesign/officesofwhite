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
    when 2
      step_two
    when 3
      step_three
    when 4
      step_four
    end
  end

  #REFACTOR into one method
  def step_one
    @header = "bg-index"
    find_documents_for_step(current_user.find_documents_for_current_step)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "documents",
          template: "layouts/step_one.pdf.haml"
      end
    end
  end

  def step_two
    @header = "bg-index"
    find_documents_for_step(current_user.find_documents_for_current_step)
  end

  def step_three
    @header = "bg-index"
    find_documents_for_step(current_user.find_documents_for_current_step)
  end

  def step_four
    @header = "bg-index"
    find_documents_for_step(current_user.find_documents_for_current_step)
  end

  def step_five
    @header = "bg-index"
    find_documents_for_step(current_user.find_documents_for_current_step)
  end

  def upload_documents
    if current_user.update_attributes(step_params)
      current_user.update_attributes(step_number: 0)
      redirect_to waiting_for_approval_path, alert: "Your documents were uploaded"
    else
      redirect_to steps_path, alert: "Some errors occured please re-upload your documents"
    end
  end

  def step_params
    hash = Hash.new
    current_user.find_documents_for_current_step.each do |document|
      hash[:"#{document}_attributes"] = [:file]
    end
    add_user_id_to_hash = params.require(:user).permit(hash)
    add_user_id_to_hash.transform_values { |attrs| attrs[:user_id] = current_user.id ; attrs }
  end


  def find_documents_for_step(step_documents)
    step_documents.each do |st|
      unless current_user.send(st)
        current_user.send((st.to_s+'=').to_sym, Document.new)
      end
    end
  end

end
