require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v3/tickets'
      expect(response).to have_http_status(200)
    end
  end
end