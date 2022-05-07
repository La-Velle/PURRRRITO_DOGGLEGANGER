class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.text :location
      t.date :availability

      t.timestamps
    end
  end
end
