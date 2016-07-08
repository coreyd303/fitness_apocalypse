# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  body       :text
#  summary    :string
#  created_at :datetime
#  updated_at :datetime
#

class BlogPost < ActiveRecord::Base
  
end
