class AddCoordinatesToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :latitude, :float
    add_column :pets, :longditude, :float
  end
end
