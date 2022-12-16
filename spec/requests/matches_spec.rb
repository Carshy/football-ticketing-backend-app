require 'rails_helper'

RSpec.describe 'Matches', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/matches'
      expect(response).to have_http_status(200)
    end
  end
end
