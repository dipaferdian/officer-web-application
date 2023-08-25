require 'rails_helper'

RSpec.describe Rank, type: :model do

  describe 'association' do

    it 'has_many RankOfficer' do
      t = Rank.reflect_on_association(:rank_officers)
      expect(t.macro).to eq(:has_many)
    end

    it 'has_many Officer' do
      t = Rank.reflect_on_association(:officers)
      expect(t.macro).to eq(:has_many)
    end
  end
end
