require 'rails_helper'

RSpec.feature 'User can sign in' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)

    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content("Welcome, #{ user.email }")
  end
end
