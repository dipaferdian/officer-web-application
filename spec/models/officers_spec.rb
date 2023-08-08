require 'rails_helper'

RSpec.describe Officer, type: :model do

  describe 'Officer should' do
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
