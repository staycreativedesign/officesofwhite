require 'rails_helper'

feature 'New user sign up' do
  scenario "sign up is created successfully" do
    visit(new_user_session_path)
    fill_in('First Name', :with => 'Fred')
    fill_in('Middle Name', :with => 'Jeff')
    fill_in('Last Name', :with => 'Flintstone')
  end

end
