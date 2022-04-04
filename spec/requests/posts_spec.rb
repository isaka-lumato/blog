require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { get '/users/:user_id/posts' }

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template('posts/index')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Find me in app/views/posts/index.html.erb')
    end
  end

  describe 'GET #show' do
    before(:each) { get '/users/:user_id/posts/1' }

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Find me in app/views/posts/show.html.erb')
    end
  end
end
