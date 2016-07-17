class AddFeaturedToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :featured, :boolean
  end
end
