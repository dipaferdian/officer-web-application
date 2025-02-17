# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CreateOfficer', type: :request do

  let(:user) { create(:user, is_admin: true) }
  let(:rank) { create(:rank) }

  context 'Create officers' do

    def officer_data_type(object = {})
      ({
                "id" => be_a(Integer),
                "name" => be_a(String),
                "rank" => include("id" => be_a(Integer))
              }.merge(object))
    end

    it 'should return new officer' do

      variables = {
        input: {
          name: Faker::Name.name,
          rankId: rank.id
        }
      }

      post '/graphql', params: { query: query, variables: variables }, headers: header(user)

      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("POST")
      expect(response.parsed_body["data"]["createOfficer"]).to include("officer" => officer_data_type)
      expect(response.parsed_body["data"]["createOfficer"]["officer"]).to include({
        "name" => variables[:input][:name],
        "rank" => include({
          "id" => rank.id,
          "name" => rank.name
        })
      })
      expect(response.parsed_body["data"]["createOfficer"]).to include("errors" => be_nil)
    end

    it 'should fail to create new officer when name is empty value' do
      variables = {
        input: {
          name: "",
          rankId: ""
        }
      }

      post '/graphql', params: { query: query, variables: variables }, headers: header(user)
  
      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("POST")
      expect(response.parsed_body["data"]["createOfficer"]).to be_nil
      expect(response.parsed_body["errors"]).to all(include(
          "message" => "Failed to create officer"
      ))
    end

    it 'should fail to create when unauthenticated' do

      variables = {
        input: {
          name: Faker::Name.name,
          rankId: rank.id
        }
      }

      post '/graphql', params: { query: query, variables: variables }
    
      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("POST")
      expect(response.parsed_body["data"]["createOfficer"]).to be_nil
      expect(response.parsed_body["errors"]).to all(include(
        "message" => "You are not authorized"
      ))    
    end
  end

  private

  def query
    <<~GRAPHQL
    mutation createOfficer($input: CreateOfficerInput!){
      createOfficer(input: $input){
        officer{
          id
          name
          rank{
            id
            name
          }
        },
        errors{
          path
          detail
        }
      }
    }
    GRAPHQL
  end
end


