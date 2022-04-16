require 'rails_helper'

RSpec.describe 'Posts show', type: :feature do
  scenario 'Check the existence of the current post title,
    author name, number of comments, number of likes, post body,
    username of commentor, comments text' do
    user1 = User.create(name: 'Tom', email: 'tom@abc.com', password: 'aaaaaa',
                        photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsm56ieYOuTZe84DQ0mG-uTe4YIXtsyJITsg&usqp=CAU',
                        bio: 'Teacher from Mexico')
    user2 = User.create(name: 'Sam', email: 'sam@abc.com', password: 'aaaaaa', photo: 'https://www.gravatar.com/avatar.php?gravatar_id=7bb849e723bac78e14e8c61d583577da&size=80')
    visit '/users/sign_in'
    fill_in 'user_email', with: 'tom@abc.com'
    fill_in 'user_password', with: 'aaaaaa'
    find('input[name="commit"]').click
    post1 = Post.create(author_id: user1.id, title: 'First post', text: 'This is the first post')
    Comment.create(author_id: user2.id, post_id: post1.id, text: 'Well done Tom!')
    Like.create(author_id: user2.id, post_id: post1.id)
    visit "/users/#{user1.id}/posts/#{post1.id}"
    expect(page).to have_content('Tom')
    expect(page).to have_content('First post')
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('This is the first post')
    expect(page).to have_content('Sam :')
    expect(page).to have_content('Well done Tom!')
  end
end
