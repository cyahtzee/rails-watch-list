class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :overview, :title, presence: true
  validates :title, uniqueness: true
end
