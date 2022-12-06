class User < ApplicationRecord
  validates :name, presence: true

  has_many :matches
  has_many :tickets
end
