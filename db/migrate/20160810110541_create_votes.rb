class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.integer :point_value, null: false

      t.timestamps null: false
    end
  end
end
