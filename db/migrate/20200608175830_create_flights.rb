class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :flight_num
      t.string :origin
      t.string :dest
      t.datetime :date
      t.string :description
      t.integer :duration

      t.timestamps
    end
  end
end
