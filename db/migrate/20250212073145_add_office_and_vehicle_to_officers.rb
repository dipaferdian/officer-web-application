class AddOfficeAndVehicleToOfficers < ActiveRecord::Migration[7.0]
  def change
    add_reference :officers, :office, null: true, foreign_key: true
    add_reference :officers, :vehicle, null: true, foreign_key: true
  end

  def down
    remove_reference :officers, :office, foreign_key: true
    remove_reference :officers, :vehicle, foreign_key: true
  end
end
