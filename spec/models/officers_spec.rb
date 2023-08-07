require 'rails_helper'

RSpec.describe Officer, type: :model do

  describe 'MyClass' do
    let(:officer) { create(:officer) }

    it 'should do something with officer' do
      # Here, you can access the `officer` variable

      expect(officer).to be_valid
    end
  end
end
