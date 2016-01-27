require 'rails_helper'

feature 'login user' do
  scenario '+valid - User signs in correctly' do
    visit login_path
  end
end
