# frozen_string_literal: true

module Types
  module Officers
    class OfficerType < Types::BaseObject
      field :id, Integer, null: false
      field :name, String
      field :rank, Types::Ranks::RankType, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
