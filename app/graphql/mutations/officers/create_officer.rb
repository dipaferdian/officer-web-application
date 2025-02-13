# frozen_string_literal: true

module Mutations
  module Officers
    class CreateOfficer < BaseMutation
      field :officer, Types::OfficerType, null: false
      
      argument :name, String, required: true
      argument :rank_id, ID, required: false
      
      def resolve(name:, rank_id:)
        officer = Officer.new(name: name)

        return respond_single_error("Failed to create officer") unless officer.save

          rank = Rank.find_by(id: rank_id)

          if rank.present?
            RankOfficer.create(officer: officer, rank: rank)
          end

          {
            officer: officer
          }
      end
    end
  end
end
