# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GetOfficer', type: :request do

  context 'Get officers' do

    let!(:rank) do
      create(:rank)
    end

    let!(:officers) do
      create_list(:officer, 5, rank: rank)
    end

    def query(params: { page: nil } )
      <<~GRAPHQL
      {
        officers(page: #{params[:page]}) {
          id
          name,
          rank {
                id
                name
            }
          }
      }
    GRAPHQL
    end

    def rank_data_type(object = {})
      include({
                "id" => be_a(Integer),
                "name" => be_a(String)
              }.merge(object))
    end
    def officer_data_type(object = {})
      include({
                "id" => be_a(Integer),
                "name" => be_a(String),
                "rank" => rank_data_type
              }.merge(object))
    end

    it 'should return officers with rank relation' do

      post '/graphql', params: { query: query(params: { page: 1 } ) }

      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("POST")
      expect(response.parsed_body["data"]).to include("officers" => officer_data_type)
    end
  end
end
