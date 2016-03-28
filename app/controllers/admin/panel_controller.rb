class Admin::PanelController < AdminsController
  def index
    @users = User.all
    @total_payments_received = total_payments_received
    @total_pending_payments = total_pending_payments
  end

  private

  def total_payments_received
    receipts = ReceiptItem.select { |obj| obj.paid? }
    total_value = receipts.map { |rec| rec.value.to_f }
    total_value.reduce(:+)
  end

  def total_pending_payments
    receipts = ReceiptItem.select { |obj| !obj.paid? }
    total_value = receipts.map { |rec| rec.value.to_f }
    total_value.reduce(:+)
  end

end
