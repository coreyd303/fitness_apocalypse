class AddTitleToWods < ActiveRecord::Migration
  def change
    add_column :wods, :title, :string
  end
end
