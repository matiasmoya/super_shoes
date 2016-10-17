class Article < ApplicationRecord
  belongs_to :store, optional: true

  validates :name, :description, :price, :total_in_shelf, :total_in_vault, :store, presence: true
end
