require 'rails_helper'

describe ReceiptItem do
  let(:jim) { Fabricate(:user, first_name: "Jim") }
  let(:receipt) { Fabricate(:receipt, user_id: jim.id) }
  let(:receipt_item) { Fabricate(:receipt_item, receipt_id: receipt.id) }
end
