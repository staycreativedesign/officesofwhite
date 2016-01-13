require 'rails_helper'

describe StepOne do
  it { should validate_presence_of(:letter_of_presentation) }
  it { should validate_presence_of(:payment_proof) }
  it { should belong_to(:user) }
end
