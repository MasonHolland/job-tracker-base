class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :branch
      t.references :company, foreign_key: true
    end
  end
end
