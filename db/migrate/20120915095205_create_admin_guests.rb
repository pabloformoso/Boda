class CreateAdminGuests < ActiveRecord::Migration
  def change
    create_table :admin_guests do |t|
      t.string :name
      t.string :lastname
      t.string :city
      t.boolean :has_confirmed
      t.integer :number_of_companions

      t.timestamps
    end
  end
end
