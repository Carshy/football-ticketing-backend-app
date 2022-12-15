require 'swagger_helper'

RSpec.describe 'Matches API', type: :request do

    path '/api/v1/matches' do
    
        get 'Retrieves Matches' do
            tags 'Matches'
            consumes 'application/json', 'application/xml'
            parameter name: :Authorization, in: :header, type: :string, required: true
            parameter name: :Accept, in: :header, type: :string, required: true
    
            response '200', 'matches found' do
          schema type: :object,
             properties: {
                data: {
                  type: :array,
                  items: {
                 type: :object,
                 properties: {
                    id: { type: :integer },
                    type: { type: :string },
                    attributes: {
                      type: :object,
                      properties: {
                         stadium: { type: :string },
                         location: { type: :string },
                         home_team: { type: :string },
                         away_team: { type: :string },
                         price: { type: :integer },
                         date: { type: :string },
                         photo: { type: :string },
                         user_id: { type: :integer }
                      }
                    }
                 }
                  }
                }
             }
    
          run_test!
        end
    
        response '401', 'unauthorized' do
          let(:Authorization) { 'invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        response '404', 'not found' do
            let(:Authorization) { 'invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!

        end

        response '500', 'internal server error' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!

        end

        response '422', 'unprocessable entity' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        response '400', 'bad request' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        post 'Creates a Match' do
            tags 'Matches'
            consumes 'application/json', 'application/xml'
            parameter name: :Authorization, in: :header, type: :string, required: true
            parameter name: :Accept, in: :header, type: :string, required: true
            parameter name: :match, in: :body, schema: {
          type: :object,
          properties: {
            stadium: { type: :string },
            location: { type: :string },
            home_team: { type: :string },
            away_team: { type: :string },
            price: { type: :integer },
            date: { type: :string },
            photo: { type: :string },
            user_id: { type: :integer }
          },
          required: [ 'stadium', 'location', 'home_team', 'away_team', 'price', 'date', 'photo', 'user_id' ]
        }
    
            response '201', 'match created' do
                let(:Authorization) { ' valid' }
                let(:Accept) { 'application/vnd.api+json' }
                let(:match) { { stadium: 'stadium', location: 'location', home_team: 'home_team', away_team: 'away_team', price: 'price', date: 'date', photo: 'photo', user_id: 'user_id' } }
            run_test!
            end
        end

        response '401', 'unauthorized' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        response '404', 'not found' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        response '500', 'internal server error' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        response '422', 'unprocessable entity' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end

        response '400', 'bad request' do
            let(:Authorization) { '
            invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            run_test!
        end
    end

        path '/api/v1/matches/{id}' do
            
            get 'Retrieves a Match' do
                tags 'Matches'
                consumes 'application/json', 'application/xml'
                parameter name: :Authorization, in: :header, type: :string, required: true
                parameter name: :Accept, in: :header, type: :string, required: true
                parameter name: :id, :in => :path, :type => :string
        
                response '200', 'match found' do
                    schema type: :object,
                    properties: {
                        data: {
                            type: :object,
                            properties: {
                                id: { type: :integer },
                                type: { type: :string },
                                attributes: {
                                    type: :object,
                                    properties: {
                                        stadium: { type: :string },
                                        location: { type: :string },
                                        home_team: { type: :string },
                                        away_team: { type: :string },
                                        price: { type: :integer },
                                        date: { type: :string },
                                        photo: { type: :string },
                                        user_id: { type: :integer }
                                    }
                                }
                            }
                        }
                    }
                    let(:Authorization) { ' valid' }
                    let(:Accept) { 'application/vnd.api+json' }
                    let(:id) { Match.create(stadium: 'stadium', location: 'location', home_team: 'home_team', away_team: 'away_team', price: 'price', date: 'date', photo: 'photo', user_id: 'user_id').id }
                    run_test!
                end
            end
        end

end
        

