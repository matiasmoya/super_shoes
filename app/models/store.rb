class Store < ApplicationRecord
  has_many :articles

  validates :name, :address, presence: true
end
