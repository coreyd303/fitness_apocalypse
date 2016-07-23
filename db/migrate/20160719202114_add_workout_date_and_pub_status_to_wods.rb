class AddWorkoutDateAndPubStatusToWods < ActiveRecord::Migration
  def change
    add_column :wods, :workout_date, :datetime
    add_column :wods, :pub_status, :string
  end
end
