class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.string :title
      t.string :wod_type
      t.text :body
      t.string :notes
      t.timestamps null: :false
    end
  end
end
