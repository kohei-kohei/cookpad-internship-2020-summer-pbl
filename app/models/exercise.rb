class Exercise < ApplicationRecord
  validates :name, presence: true, exclusion: { in: [nil] }
  validates :time, presence: true, numericality: true, exclusion: { in: [nil] }
end
