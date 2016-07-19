class AddPubStatusToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :pub_status, :string
  end
end
