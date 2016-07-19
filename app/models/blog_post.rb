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

class BlogPost < ActiveRecord::Base
  belongs_to :user

  validates :title, :summary, :body, :pub_status, presence: :true

  def author
    if user.try(:profile)
      user.profile.first_name + " " + user.profile.last_name
    else
      "Predator Camp HQ"
    end
  end
end
