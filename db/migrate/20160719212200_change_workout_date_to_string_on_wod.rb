class ChangeWorkoutDateToStringOnWod < ActiveRecord::Migration
  def change
    change_column :wods, :workout_date, :string
  end
end
