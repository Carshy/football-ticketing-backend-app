require 'swagger_helper'

describe 'Matches API' do
  path '/api/v3/tickets' do
    post 'Creates a ticket' do
      tags 'Tickets'
      consumes 'application/json'
      parameter name: :ticket, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          date: { type: :string },
          city: { type: :string },
          user_id: { type: :integer },
          match_id: { type: :integer },
          quantity: { type: :integer }
        },
        required: %w[id date city user_id match_id quantity]
      }

      response '200', 'ticket created' do
        let(:ticket) { { date: '2020-10-10', city: 'City', user_id: 1, match_id: 1, quantity: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:ticket) { { city: 'City' } }
        run_test!
      end
    end
  end

  path '/api/v3/tickets' do
    get 'Gets all tickets' do
      tags 'Tickets'
      produces 'application/json'
      response '200', 'ticket found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 date: { type: :string },
                 city: { type: :string },
                 user_id: { type: :integer },
                 match_id: { type: :integer },
                 quantity: { type: :integer }
               },
               required: %w[id date city user_id match_id quantity]

        let(:ticket) { { date: '2020-10-10', city: 'City', user_id: 1, match_id: 1, quantity: 1 } }
        run_test!
      end

      response '404', 'ticket not found' do
        let(:ticket) { 'invalid' }
        run_test!
      end
    end
  end
end
