class CreateConv < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false

      t.timestamps
    end

    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
    add_index :conversations, [:sender_id, :recipient_id], unique: true
  end
end
