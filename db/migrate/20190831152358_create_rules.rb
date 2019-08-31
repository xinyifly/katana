class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :key
      t.string :value

      t.timestamps
    end
    add_index :rules, [:poll_id, :key], unique: true
  end
end
