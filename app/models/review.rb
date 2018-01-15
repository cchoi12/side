class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5],
    message: "%{value} must be between 1 and 5"
  }

  STAR = [1, 2, 3, 4, 5]
end
