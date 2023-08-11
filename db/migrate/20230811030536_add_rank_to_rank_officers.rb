class AddRankToRankOfficers < ActiveRecord::Migration[7.0]
  def change
    add_reference :rank_officers, :rank, null: false, foreign_key: true
  end
end
