require 'rails_helper'

feature 'User upload documents' do
  before do
    jim = Fabricate(:user, approved: true, step_number: 1)
    sign_in(jim)
  end
  scenario 'uploads all documents' do
    visit steps_path
    page.attach_file('user[letter_of_representation_attributes][file]', invoice )
    page.attach_file('user[service_agreement_attributes][file]', invoice )
    page.attach_file('user[disclosure_statement_attributes][file]', invoice)
    click_button('Upload Documents')
  end

  def invoice
    Rails.root + 'spec/support/invoice.pdf'
  end
end
