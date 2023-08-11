require 'rails_helper'

RSpec.describe Officer, type: :model do

  describe "association" do

    let!(:rank) do
      create(:rank)
    end

    let!(:officer) do
      create(:officer)
    end

    let!(:rank_officer) do
      create(:rank_officer, rank_id: rank.id, officer_id: officer.id)
    end

    it 'has one Rank through RankOfficer' do
      t = Officer.reflect_on_association(:rank)
      expect(t.macro).to eq(:has_one)
    end

    it 'has one RankOfficer' do
      t = Officer.reflect_on_association(:rank_officer)
      expect(t.macro).to eq(:has_one)
    end

    it 'should officer have a rank' do

      expect(Officer.find(officer.id).rank).to eq(rank)
    end

  end

  describe 'validate input' do
    let(:officer) { create(:officer) }

    it 'should be valid when input string with valid input' do

      expect(officer).to be_valid
    end

    context 'When input string as nil' do
      before do
        officer.name = nil
      end

      it 'should be not valid' do

        expect(officer).not_to be_valid
      end
    end
  end
end
