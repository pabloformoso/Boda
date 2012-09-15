class AddGuestToUser < ActiveRecord::Migration
  def change
    add_column :admin_guests, :user_id, :integer
    add_column :admin_guests, :main, :boolean
  end
end