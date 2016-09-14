class Room < ApplicationRecord
  UPDATEABLE_ATTRS = [:name, :description, :slug]

  has_many :messages
  validates :name, presence: true
end