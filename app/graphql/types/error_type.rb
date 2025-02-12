# frozen_string_literal: true

module Types
  class ErrorType < Types::BaseObject
    description 'Error'

    field :path, String, null: true
    field :detail, String, null: false
  end
end
