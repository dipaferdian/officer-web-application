# frozen_string_literal: true

module OfficerServices
  class OfficerNew < ApplicationService
    def initialize
    end

    def call
      new_officer
    end

    private

    def new_officer
      @officer = Officer.new
    end
  end

end
