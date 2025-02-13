# frozen_string_literal: true

module Types
  class RankType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
