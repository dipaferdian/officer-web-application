# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfficersController, type: :controller do

  describe "GET index" do

    let!(:rank) do
      create(:rank)
    end

    let!(:officers) do
      create_list(:officer, 5, rank: rank)
    end

    def paginate_data_type(object ={})
      include({
                next_number_page: be_a(Integer),
                next_page: be_a(String),
                prev_page: be_a(String),
                prev_number_page: be_a(Integer)
              }.merge(object))
    end
    def officer_data_type(object = {})
      include({
                        id: be_a(Integer),
                        name: be_a(String),
                        rank: be_a(Rank)
                      }.merge(object))
    end

    it 'should have return officers with 2 data with rank relation' do
      get :index, params: { page: 1 }

      expect(assigns(:officers)).to include(officers: officer_data_type)
      expect(assigns(:officers)).to include(paginate: paginate_data_type(:next_number_page => 2))
    end
  end
end