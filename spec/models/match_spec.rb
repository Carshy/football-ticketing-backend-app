require 'rails_helper'

RSpec.describe Match, type: :model do
 user = User.create(name: 'Name')      
 match = Match.new(stadium: 'Stadium', location: 'Location', home_team: 'Home team', away_team: 'Away team', price: 100, date: '2020-10-10', photo: 'app_screenshot.png', user_id: 1)

  describe 'checking the match model' do
    it 'should give the stadium name' do
     match.stadium = 'Stadium'
      expect(match).to be_valid
    end

    it 'should give home team' do
      match.home_team = 'Home team'
      expect(match).to be_valid
    end

    it 'should give away team' do
        match.away_team = 'Away team'
        expect(match).to be_valid
    end

    it 'should give the location' do
      match.location = 'Location'
      expect(match).to be_valid
    end

    it 'should give the date' do
        match.date = '2020-10-10'
        expect(match).to be_valid
    end

    it 'should give the price' do
        match.price = 100
        expect(match).to be_valid
    end
  end
end
