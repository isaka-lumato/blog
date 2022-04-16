require 'rails_helper'

RSpec.describe 'posts index page', type: :feature do
  scenario 'Check the existence of user profile picture, username, number posts,
    post title, post body, comments, number of comments, first comment, number of posts, number of likes,
    pagination, post link functionality' do
    user1 = User.create(name: 'Tom', email: 'tom@abc.com', password: 'aaaaaa', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsm56ieYOuTZe84DQ0mG-uTe4YIXtsyJITsg&usqp=CAU')
    user2 = User.create(name: 'Sam', email: 'sam@abc.com', password: 'aaaaaa', photo: 'https://www.gravatar.com/avatar.php?gravatar_id=7bb849e723bac78e14e8c61d583577da&size=80')
    post1 = Post.create(author_id: user1.id, title: 'First post', text: 'This is the first post')
    post2 = Post.create(author_id: user1.id, title: 'Second post', text: 'This is the second post')
    post3 = Post.create(author_id: user1.id, title: 'Third post', text: 'This is the third post')

    Comment.create(author_id: user2.id, post_id: post1.id, text: 'Well done Tom!')
    Like.create(author_id: user2.id, post_id: post1.id)
    visit new_user_registration_path
    fill_in 'user_email', with: 'abc@abc.com'
    fill_in 'user_password', with: 'aaaaaa'
    fill_in 'user_password_confirmation', with: 'aaaaaa'
    find('input[name="commit"]').click
    visit "/users/#{user1.id}/posts"
    expect(page).to have_content(user1.name)
    expect(page).to have_css('img')
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('First post')
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
    expect(page).to have_content('This is the first post')
    expect(page).to have_content('Well done Tom!')
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('Pagination')
    click_link(post1.title)
    expect(current_path).to eq "/users/#{user1.id}/posts/#{post1.id}"
    visit "/users/#{user1.id}/posts"
    click_link(post2.title)
    expect(current_path).to eq "/users/#{user1.id}/posts/#{post2.id}"
  end
end
