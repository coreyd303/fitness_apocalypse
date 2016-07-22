class ChangeWodDurationToString < ActiveRecord::Migration
  def change
    change_column :wods, :duration, :string
  end
end
