class Article < ApplicationRecord
  belongs_to :store

  validates :name, :description, :price, :total_in_shelf, :total_in_vault, presence: true
end
