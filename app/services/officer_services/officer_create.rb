# frozen_string_literal: true

module OfficerServices

    class OfficerCreate < ApplicationService
      def initialize(officer)
        @officer = officer[:officer]
      end

      def call
        create_officer
      end

      private

      def create_officer
        @officer = Officer.new(@officer)
      end
    end

end

