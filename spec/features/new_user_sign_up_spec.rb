require 'rails_helper'

feature 'New user sign up' do
  scenario "sign up is created successfully" do
    visit(new_user_session_path)
    select('mr.', from: 'user_suffix')
  end

end
