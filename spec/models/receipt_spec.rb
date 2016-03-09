require 'rails_helper'

describe Receipt do
  let(:jim) { Fabricate(:user, first_name: "Jim") }
  subject { Fabricate(:receipt, user_id: jim.id, name: "Jim's Receipts" ) }
  it { should belong_to(:user) }
  it { should have_many(:receipt_items) }
  it { is_expected.to have_attributes(:name => "Jim's Receipts") }

end
