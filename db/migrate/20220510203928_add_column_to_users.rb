class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change

    add_column :users, :admin, :boolean
    add_column :pets, :user_id, :bigint
    add_column :bookings, :user_id, :bigint
    add_column :bookings, :pet_id, :bigint
    add_foreign_key :pets, :users
    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :pets
  end
end
