class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.string :weapon
      t.string :vehicle
      t.belongs_to :location, null: false, foreign_key: true
      t.belongs_to :affiliation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
