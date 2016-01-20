require 'rails_helper'

feature 'Step one' do
  before :each do
    sign_in Fabricate(:user)
  end
  scenario "User has access to step one" do
    visit new_user_first_step_path(@user)
    expect(page).to have_content("Please make sure all documents are notarized before uploading them. If files are not notarize you will not be able to proceed")
  end
end
