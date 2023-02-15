require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users'
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(1) }

    it 'should be a successful response' do
      expect(response.status).to eq(200)
    end

    it 'should render the show template' do
      expect(response).to render_template('show')
    end

    it 'response should contain #UserDetailsPage' do
      expect(response.body).to include('User details page')
    end
  end
end
