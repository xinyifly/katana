class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :name

      t.timestamps
    end
    add_index :polls, :name, unique: true
  end
end
