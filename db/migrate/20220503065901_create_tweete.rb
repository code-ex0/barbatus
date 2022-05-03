class CreateTweete < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
