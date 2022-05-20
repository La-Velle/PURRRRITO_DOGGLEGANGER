class AddCategoryToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :category, :string
  end
end
