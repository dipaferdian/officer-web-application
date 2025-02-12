class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :province
      t.timestamps
    end
  end

  def down
    drop_table :offices
  end
end
