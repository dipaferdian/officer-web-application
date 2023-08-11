class Rank < ApplicationRecord
  has_many :rank_officers
  has_many :officers, through: :rank_officers
end
