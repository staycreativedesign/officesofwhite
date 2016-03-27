class StepsController < ApplicationController
  before_action :require_user

  def index
    case current_user.find_current_step
    when nil
      redirect_to new_user_path
    when 0
      redirect_to waiting_for_approval_path
    when 1
      step_1
    when 2
      step_2
    when 3
      step_3
    when 4
      step_4
    end
  end

  def step_1
    @header = "bg-step_1"
    find_documents_for_step(current_user.find_documents_for_current_step)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "documents",
          template: "layouts/step_one.pdf.haml"
      end
    end
  end

  def step_2
    @header = "bg-step_2"
  end
  def step_3
    @header = "bg-step_3"
    find_documents_for_step(current_user.find_documents_for_current_step)
  end

  def step_4
    @header = "bg-step4"
    find_documents_for_step(current_user.find_documents_for_current_step)
  end

  def upload_documents
    if current_user.update_attributes(step_params)
      current_user.update_attributes(step_number: 0)
      send_docs
      redirect_to waiting_for_approval_path, alert: "Your documents were uploaded"
    else
      redirect_to steps_path, alert: "Some errors occured please re-upload your documents"
    end
  end





  private

  def send_docs
    @files = []
    params["user"].each { |file| @files << file }
    NotificationsMailer.send_admin_documents(@files, current_user).deliver_now
  end

  def step_params
    hash = Hash.new
    current_user.find_documents_for_current_step.each { |document| hash[:"#{document}_attributes"] = [:file] }
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

  def approve_initial_receipt
    # Approval initial recept to pass to step 3
  end

end
