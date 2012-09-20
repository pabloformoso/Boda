class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :guest

      t.timestamps
    end
    add_index :messages, :guest_id
  end
end
