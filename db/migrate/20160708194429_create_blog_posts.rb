class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.integer :user_id
      t.text :body
      t.string :summary
      t.timestamps null: :false
    end
  end
end
