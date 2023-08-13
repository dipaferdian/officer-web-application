# frozen_string_literal: true

module OfficerServices

  class OfficerGet < ApplicationService

    def initialize(page:)
      @page = page
    end

    def call
      get_officer
    end

    private

    def get_officer
      Officer.paginate(page: @page, per_page: 2).find_by_sql("SELECT id, name FROM officers ORDER BY id asc")
    end
  end
end