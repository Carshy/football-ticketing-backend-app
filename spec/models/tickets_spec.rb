require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
    user = User.create(name: 'Name')
    match = Match.create(stadium: 'Stadium', location: 'Location', home_team: 'Home team', away_team: 'Away team', price: 100, date: '2020-10-10', photo: 'app_screenshot.png', user_id: 1)
    ticket = Ticket.new(date: '2020-10-10', city: 'City', user_id: 1, match_id: 1, quantity: 1)

    describe 'checking the ticket model' do
        it 'should give the date' do
            ticket.date = '2020-10-10'
            expect(ticket).to be_valid
        end

        it 'should give the city' do
            ticket.city = 'City'
            expect(ticket).to be_valid
        end

        it 'should give the user id' do
            ticket.user_id = 1
            expect(ticket).to be_valid
        end

        it 'should give the match id' do
            ticket.match_id = 1
            expect(ticket).to be_valid
        end

        it 'should give the quantity' do
            ticket.quantity = 1
            expect(ticket).to be_valid
        end
    end
end
