# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CreateOfficer', type: :request do

  context 'Create officers' do

    def mutation(params: { name: nil } )
      <<~GRAPHQL
          mutation {
            createOfficer(input: {
              name: "#{params[:name]}"
          }){
          officer{
             id,
             name
          },
          errors
          }
        }
      GRAPHQL
    end

    def officer_data_type(object = {})
      ({
                "id" => be_a(Integer),
                "name" => be_a(String)
              }.merge(object))
    end

    it 'should return new officer' do

      post '/graphql', params: { query: mutation(params: { name: Faker::Name.name } ) }

      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("POST")
      expect(response.parsed_body["data"]).to include("createOfficer" => include("officer" => officer_data_type))
      expect(response.parsed_body["data"]).to include("createOfficer" => include("errors" => eq([])))
    end

  end

  context 'Create officers with Rank' do

    let(:rank) do
      create(:rank)
    end

    def mutation(params: { name: nil, rank_id: nil } )
      <<~GRAPHQL
          mutation {
            createOfficer(input: {
              name: "#{params[:name]}",
              rankId: #{params[:rank_id]}
          }){
          officer{
             id,
             name,
             rank {
                id,
                name
             }   
          },
          errors
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
      ({
        "id" => be_a(Integer),
        "name" => be_a(String),
        "rank" => rank_data_type
      }.merge(object))
    end


    it 'should return new officer with rank relation' do

      post '/graphql', params: { query: mutation(params: { name: Faker::Name.name, rank_id: rank.id } ) }

      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("POST")
      expect(response.parsed_body["data"]).to include("createOfficer" => include("officer" => officer_data_type))
      expect(response.parsed_body["data"]).to include("createOfficer" => include("errors" => eq([])))
    end
  end
end
