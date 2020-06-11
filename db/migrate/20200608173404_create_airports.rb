class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports, id: false do |t|
      t.string :code
      t.string :name
      t.string :city
      t.string :country
      t.decimal :latitude
      t.decimal :longitude
      t.string :timezone

      t.timestamps
    end
  end
end
