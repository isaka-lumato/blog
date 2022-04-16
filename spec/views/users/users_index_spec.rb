require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'User Test' do
    before(:each) do
      @user1 = User.create(name: 'Sammy', photo: 'sammy.png', bio: 'Sammy bio', posts_counter: 0,
                           email: 'sammy@gmail.com', password: 'test12345')
      @user2 = User.create(name: 'Ahmed', bio: 'Ahmed bio', photo: 'sammy.png', email: 'ahmed@gmail.com',
                           password: 'test12345')
      @user3 = User.create(name: 'John', bio: 'John bio', photo: 'sammy.png', email: 'john@gmail.com',
                           password: 'test12345')
      visit root_path
      fill_in 'Email', with: 'ahmed@gmail.com'
      fill_in 'Password', with: 'test12345'
      click_button 'Log in'
    end

    it 'Shows the username' do
      expect(page).to have_content('Sammy')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('sammy.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Number of posts: 0')
      click_on 'Ahmed'
      expect(page).to have_no_content('John')
    end
  end
end
