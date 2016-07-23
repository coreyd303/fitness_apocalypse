class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.integer :duration
      t.string  :workout_type
      t.text    :workout
      t.timestamps null: :false
    end
  end
end
