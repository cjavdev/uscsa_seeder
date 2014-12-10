require 'rails_helper'

RSpec.feature 'Officer can sign in' do
  scenario 'successfully' do
    visit '/officers/sign_in'
    fill_in 'email', with: 'jobs@apple.com'
    fill_in 'password', with: 'password'
    click 'Sign In'
  end
end
