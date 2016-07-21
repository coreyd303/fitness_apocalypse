class AddStartTimeToWods < ActiveRecord::Migration
  def change
    add_column :wods, :start_time, :datetime
  end
end
