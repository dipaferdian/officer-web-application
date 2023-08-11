class Officer < ApplicationRecord
  has_one :rank_officer
  has_one :rank, through: :rank_officer
  validates :name, presence: true, length: { maximum: 255 }
end
