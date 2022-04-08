require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET index' do
    before(:each) { get '/users' }

    it 'it should render a template' do
      expect(response).to render_template('users/index')
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Blog')
    end
  end

  describe 'GET show' do
    user = User.create(name: 'isaka', posts_counter: 0)
    before(:each) { get user_path id: user.id }

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render a template' do
      expect(response).to render_template('users/show')
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Blog')
    end
  end
end
