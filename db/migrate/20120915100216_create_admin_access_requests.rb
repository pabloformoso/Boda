class CreateAdminAccessRequests < ActiveRecord::Migration
  def change
    create_table :admin_access_requests do |t|
      t.string :name
      t.string :email
      t.boolean :revised, :default => false

      t.timestamps
    end
  end
end
