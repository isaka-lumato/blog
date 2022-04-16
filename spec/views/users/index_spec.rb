require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  scenario 'Check the existence of the usernames and photos on the users index page, check links functionality' do
    user1 = User.create(name: 'Tom', email: 'tom@abc.com', password: 'aaaaaa', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsm56ieYOuTZe84DQ0mG-uTe4YIXtsyJITsg&usqp=CAU')
    visit new_user_registration_path
    fill_in 'user_email', with: 'abc@abc.com'
    fill_in 'user_password', with: 'aaaaaa'
    fill_in 'user_password_confirmation', with: 'aaaaaa'
    find('input[name="commit"]').click
    visit '/users'
    expect(page).to have_content(user1.name)
    expect(page).to have_css('img')
    expect(page).to have_content('Number of posts: 0')
    visit '/users/1'
    expect(page).to have_content('Bio')
  end
end
