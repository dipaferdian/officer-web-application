require 'rails_helper'

RSpec.describe RankOfficer, type: :model do

  describe 'association' do

    it 'belongs_to Rank' do
      t = RankOfficer.reflect_on_association(:rank)
      expect(t.macro).to eq(:belongs_to)
    end

  end
end
