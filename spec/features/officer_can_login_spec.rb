require 'rails_helper'

RSpec.feature 'Officer can sign in' do
  scenario 'successfully' do
    visit '/officers/sign_in'
    fill_in 'Email', with: 'jobs@apple.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
