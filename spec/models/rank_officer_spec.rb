require 'rails_helper'

RSpec.describe RankOfficer, type: :model do

  describe 'association' do

    it 'has one Rank' do
      t = RankOfficer.reflect_on_association(:rank)
      expect(t.macro).to eq(:has_one)
    end
  end
end
