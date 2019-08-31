class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
    add_index :candidates, [:user_id, :poll_id], unique: true
  end
end
