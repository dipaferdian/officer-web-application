class ChangeOfficeIdAndVehicleIdToNullable < ActiveRecord::Migration[7.0]
  def up
    change_column_null :officers, :office_id, true
    change_column_null :officers, :vehicle_id, true
  end

  def down
    change_column_null :officers, :office_id, false
    change_column_null :officers, :vehicle_id, false
  end
end
