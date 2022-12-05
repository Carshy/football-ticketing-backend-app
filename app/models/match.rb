class Match < ApplicationRecord
    validates :home_team, presence: true
    validates :away_team, presence: true 
    validates :stadium, presence: true
    validates :location, presence: true
    validates :date, presence: true
    validates :price, presence: true
    validates :photo, presence: true

  belongs_to :user
  has_many :tickets
end
