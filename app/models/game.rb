class Game < ApplicationRecord
  enum board_size: {small: 0, medium: 1, large: 2}

  belongs_to :user
  belongs_to :black
  belongs_to :white

  validates :name, :user, presence: true
  validates :handicap, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9}
  validates :komi, format: {with: /[0-9]\.5/}, numericality: {greater_than_or_equal_to: 0.5, less_than_or_equal_to: 9.5}
end
