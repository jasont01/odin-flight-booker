class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :origin
      t.integer :dest
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
