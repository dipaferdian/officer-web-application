# frozen_string_literal: true
module OfficerServices

  class OfficerDetail < ApplicationService
    def initialize(officer:)
      @officer = officer
    end

    def call
      detail_officer
    end

    private

    def detail_officer
      @officer
    end
  end
end
