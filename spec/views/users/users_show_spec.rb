require 'rails_helper'

RSpec.describe 'user#Show', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create(name: 'Sammy', photo: 'sammy.png', bio: 'Sammy bio', posts_counter: 0,
                           email: 'sammy@gmail.com', password: 'test12345')
      @user2 = User.create(name: 'Ahmed', bio: 'Ahmed bio', photo: 'ahmed.png', email: 'ahmed@gmail.com',
                           password: 'test12345')
      @user3 = User.create(name: 'John', bio: 'John bio', photo: 'john.png', email: 'john@gmail.com',
                           password: 'test12345')

      visit root_path
      fill_in 'Email', with: 'sammy@gmail.com'
      fill_in 'Password', with: 'test12345'
      click_button 'Log in'
      @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                           author: @user1)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                           author: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                           author: @user1)
      @post4 = Post.create(title: 'Fourth Post', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0,
                           author: @user1)
      visit user_path(@user1.id)
    end

    it "show user's profile picture" do
      all('img').each do |i|
        expect(i[:src]).to eq('sammy.png')
      end
    end

    it "show user's name" do
      expect(page).to have_content 'Sammy'
    end

    it 'show number of posts per user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it "show user's bio." do
      expect(page).to have_content('bio')
    end

    it "show user's first 3 posts." do
      expect(page).to have_content 'This is my fourth post'
      expect(page).to have_content 'This is my third post'
      expect(page).to have_content 'This is my second post'
    end

    it "show button that lets me view all of a user's posts." do
      expect(page).to have_link('Show All Posts')
    end

    it "click post and redirect to that post's show page." do
      click_link 'Show All Posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end

    it "click see all posts and redirects to user's post's index page." do
      click_link 'Show All Posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
