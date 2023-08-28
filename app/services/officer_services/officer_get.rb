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
      @officers =  Officer.left_joins(:rank).paginate_by_sql(['select officers.id, officers.name from officers order by id asc'],:page => @page, :per_page => 2)

      @officers = @officers.map do |officer|
      {
        id: officer.id,
        name: officer.name,
        rank: officer.rank
      }
      end

      prev_page_number = (@page.to_i - 1)
      next_page_number = @page.to_i + 1
      current_page_number = @page

      if next_page_number <= 0 || prev_page_number <= 0
        prev_page_number = 1
      end

      if current_page_number.nil?
        next_page_number = @page.to_i + 2
      end

      pagination = {
        next_number_page:next_page_number,
        next_page: "officers?page=#{next_page_number.to_s}",
        prev_page: "officers?page=#{prev_page_number.to_s}",
        prev_number_page: prev_page_number
      }

      {
        officers: @officers,
        paginate: pagination
      }

    end
  end
end