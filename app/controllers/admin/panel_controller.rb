class Admin::PanelController < AdminsController
  def index
    @users = User.all
    @total_payments_received = total_payments_received
  end

  private

  def total_payments_received
    ReceiptItem.select { |obj| obj.paid? }
  end

end
