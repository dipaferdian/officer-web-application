class Officer < ApplicationRecord

  has_one :rank_officer
  has_one :rank, through: :rank_officer

  belongs_to :office, optional: true
  belongs_to :vehicle, optional: true

  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
end
