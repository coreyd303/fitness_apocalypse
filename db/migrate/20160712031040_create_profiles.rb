class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :age
      t.integer :yearshunting
      t.integer :huntingstyle

      t.timestamps null: false
    end
  end
end
