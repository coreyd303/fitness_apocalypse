class RemoveTitleFromWods < ActiveRecord::Migration
  def change
    remove_column :wods, :title
  end
end
