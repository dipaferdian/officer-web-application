# frozen_string_literal: true
module OfficerServices

  class OfficerDetail < ApplicationService
    def initialize(officer: __id__ = nil)
      @officer = officer
    end

    def call
      detail_officer
    end

    private

    def detail_officer
     @officer = Officer.find(@officer)
    end
  end
end
