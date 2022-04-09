require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:text) }

  context 'when validating format of attributes' do
    it { should validate_numericality_of(:comments_counter).is_greater_than(-1) }
  end

  context 'when validating format of attributes' do
    it { should validate_numericality_of(:likes_counter).is_greater_than(-1) }
  end

  it 'loads only the recent 5 comments' do
    expect(subject.recent_comments).to eq(subject.comments.last(5))
  end

  it 'updates a posts comments correctly' do
    user = User.create(name: 'WevAvenger', posts_counter: 0)
    post = user.posts.create(title: 'Post1', text: 'Using the Web to Avenger for the world! Yeeh', likes_counter: 0,
                             comments_counter: 0)
    post.comments.create(author_id: user.id, post_id: post.id, text: 'Hi isaka WebAvenger!')
    expect(post.comments_counter).to eql(1)
  end
end
