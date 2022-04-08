require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'isaka', posts_counter: 0)
  post = user.posts.create(title: 'Post1', text: 'The WebAvenger', likes_counter: 0, comments_counter: 0)
  describe 'GET posts' do
    before(:each) { get user_posts_path user_id: user.id }

    it 'should render a template' do
      expect(response).to render_template('posts/index')
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Blog')
    end
  end

  describe 'GET show' do
    before(:each) { get user_post_path user_id: user.id, id: post.id }

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render a template' do
      expect(response).to render_template('posts/show')
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Blog')
    end
  end
end
