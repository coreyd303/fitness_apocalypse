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
#  pub_status :string
#  featured   :boolean
#

FactoryGirl.define do
  factory :blog_post do
    title "aaaaahhhh blog"
    summary "sum of it foo"
    body "No-body knows the troubles I seeeeeee . . . "
    pub_status "P"
  end
end
