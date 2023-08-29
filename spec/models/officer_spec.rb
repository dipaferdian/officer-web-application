require 'rails_helper'

RSpec.describe Officer, type: :model do

  describe "association" do

    let!(:rank) do
      create(:rank, name: "Anggota")
    end

    let!(:officer) do
      create(:officer)
    end

    let!(:rank_officer) do
      create(:rank_officer, rank_id: rank.id, officer_id: officer.id)
    end

    def rank_type_data(object = {})
      have_attributes({
                id: be_a(Integer),
                name: be_a(String),
                created_at: be_a(ActiveSupport::TimeWithZone),
                updated_at: be_a(ActiveSupport::TimeWithZone)
              }.merge(object))
    end

    def get_officer
      Officer.find(officer.id)
    end

    it 'has_one Rank through RankOfficer' do
      t = Officer.reflect_on_association(:rank)
      expect(t.macro).to eq(:has_one)
    end

    it 'has_one RankOfficer' do
      t = Officer.reflect_on_association(:rank_officer)
      expect(t.macro).to eq(:has_one)
    end

    it 'should officer have a rank' do

      expect(get_officer.rank).to rank_type_data
      expect(get_officer.rank).to have_attributes(name: "Anggota")
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
