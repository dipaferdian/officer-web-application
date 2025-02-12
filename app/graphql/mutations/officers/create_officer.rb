# frozen_string_literal: true

module Mutations
  module Officers
    class CreateOfficer < BaseMutation
      argument :name, String, required: true
      argument :rank_id, Integer, required: false

      field :officer, Types::Officers::OfficerType, null: false
      field :errors, [String], null: false

      def resolve(name:, rank_id: nil)
        officer = Officer.new(name: name)

        return respond_single_error("Failed to create officer") unless officer.save

          rank = Rank.find_by(id: rank_id)

          if rank.present?
            RankOfficer.create(officer: officer, rank: rank)
          end

          {
            officer: officer,
            errors: []
          }
      end
    end
  end
end
