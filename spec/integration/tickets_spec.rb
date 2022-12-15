require 'swagger_helper'

RSpec.describe 'Tickets API', type: :request do
    path '/api/v3/tickets' do
        get 'Retrieves Tickets' do
        tags 'Tickets'
        consumes 'application/json', 'application/xml'
        parameter name: :Authorization, in: :header, type: :string, required: true
        parameter name: :Accept, in: :header, type: :string, required: true
    
        response '200', 'tickets found' do
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
                        date: { type: :string },
                        city: { type: :string },
                        user_id: { type: :integer },
                        match_id: { type: :integer },
                        quantity: { type: :integer }
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
        end
    end

    path '/api/v3/tickets' do
        post 'Creates a Ticket' do
        tags 'Tickets'
        consumes 'application/json', 'application/xml'
        parameter name: :Authorization, in: :header, type: :string, required: true
        parameter name: :Accept, in: :header, type: :string, required: true
        parameter name: :ticket, in: :body, schema: {
            type: :object,
            properties: {
            date: { type: :string },
            city: { type: :string },
            user_id: { type: :integer },
            match_id: { type: :integer },
            quantity: { type: :integer }
            },
            required: [ 'date', 'city', 'user_id', 'match_id', 'quantity' ]
        }
    
        response '201', 'ticket created' do
            let(:Authorization) { 'valid' }
            let(:Accept) { 'application/vnd.api+json' }
            let(:ticket) { { date: '2020-12-12', city: 'Buenos Aires', user_id: 1, match_id: 1, quantity: 2 } }
            run_test!
        end

        response '422', 'invalid request' do
            let(:Authorization) { 'valid' }
            let(:Accept) { 'application/vnd.api+json' }
            let(:ticket) { { date: '2020-12-12', city: 'Buenos Aires', user_id: 1, match_id: 1, quantity: 2 } }
            run_test!
        end

        response '401', 'unauthorized' do
            let(:Authorization) { ' invalid' }
            let(:Accept) { 'application/vnd.api+json' }
            let(:ticket) { { date: '2020-12-12', city: 'Buenos Aires', user_id: 1, match_id: 1, quantity: 2 } }
            run_test!
        end
        end
    end
    

