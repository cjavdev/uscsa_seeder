require 'rails_helper'

RSpec.feature 'Officer can sign in' do
  scenario 'successfully' do
    user = FactoryGirl.create(:officer)

    visit '/officers/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content("Welcome, jobs@apple.com")
  end
end
