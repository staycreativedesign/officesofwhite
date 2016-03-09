require 'rails_helper'

describe ReceiptItem do
  let(:jim) { Fabricate(:user, first_name: "Jim") }
  let(:receipt) { Fabricate(:receipt, user_id: jim.id) }
  subject { Fabricate(:receipt_item, receipt_id: receipt.id, name: "Blue Horse shoe", value: "5.00") }
  it { should belong_to(:receipt) }
  it { is_expected.to have_attributes(:name => "Blue Horse shoe", value: "5.00")  }
end
