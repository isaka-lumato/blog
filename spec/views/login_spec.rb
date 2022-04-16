require 'rails_helper'
RSpec.feature 'Login test', type: :feature do
  background { visit new_user_session_path }
  scenario 'have an email field' do
    expect(page).to have_field('Email', type: 'email')
  end

  scenario 'have a password field' do
    expect(page).to have_field('user[password]')
  end

  scenario 'have an email field' do
    expect(page).to have_button('Log in')
  end

  context 'Form Submission' do
    scenario 'Submit form without email and password' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with incorrect email and password' do
      within 'form' do
        fill_in 'Email', with: 'isaka@gmail.com'
        fill_in 'Password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end
