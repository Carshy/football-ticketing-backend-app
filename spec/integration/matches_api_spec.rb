require 'swagger_helper'

describe 'Matches API' do
  path '/api/v1/matches' do
    post 'Creates a match' do
      tags 'Matches'
      consumes 'application/json'
      parameter name: :match, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          stadium: { type: :string },
          location: { type: :string },
          date: { type: :string },
          price: { type: :integer },
          home_team: { type: :string },
          away_team: { type: :string },
          photo: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[id stadium location home_team away_team price date photo user_id]
      }

      response '200', 'match created' do
        let(:match) do
          { stadium: 'Stadium', location: 'Location', home_team: 'Home team', away_team: 'Away team',
            price: 100, date: '2020-10-10', photo: 'app_screenshot.png', user_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:match) { { stadium: 'Stadium' } }
        run_test!
      end
    end
  end

  path '/api/v1/matches' do
    get 'Gets all matches' do
      tags 'Matches'
      produces 'application/json'
      response '200', 'matches found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 stadium: { type: :string },
                 location: { type: :string },
                 date: { type: :string },
                 price: { type: :integer },
                 home_team: { type: :string },
                 away_team: { type: :string },
                 photo: { type: :string },
                 user_id: { type: :integer }
               },
               required: %w[id stadium location home_team away_team price date photo user_id]

        let(:match) do
          { stadium: 'Stadium', location: 'Location', home_team: 'Home team', away_team: 'Away team',
            price: 100, date: '2020-10-10', photo: 'app_screenshot.png', user_id: 1 }
        end
        run_test!
      end

      response '404', 'match not found' do
        let(:match) { 'invalid' }
        run_test!
      end
    end
  end
end
