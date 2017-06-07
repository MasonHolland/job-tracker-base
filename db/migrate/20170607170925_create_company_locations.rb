class CreateCompanyLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :company_locations do |t|
      t.references :company, foreign_key: true
      t.references :location, foreign_key: true
    end
  end
end
