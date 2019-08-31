class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :voter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
