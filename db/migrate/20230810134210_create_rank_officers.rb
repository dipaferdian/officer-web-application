class CreateRankOfficers < ActiveRecord::Migration[7.0]
  def change
    create_table :rank_officers do |t|

      t.timestamps
    end
    add_reference :rank_officers, :officer, null: false, foreign_key: true
  end
end
