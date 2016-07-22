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

require "rails_helper"

describe BlogPost do

  context "verify validations" do

    before(:each) do
      @blog_post = FactoryGirl.create(:blog_post)
    end

    it "is initially valid" do
      expect(@blog_post).to be_valid
    end

    xit "can only have listed statuses" do
      allowed_statuses = %w(P D A)
      allowed_statuses.each do |status|
        @blog_post.pub_status = status
        expect(@blog_post).to be_valid
      end
    end

    it "should require a valid attributes" do
      @blog_post.title = ""
      expect(@blog_post).to_not be_valid

      @blog_post.body = ""
      expect(@blog_post).to_not be_valid

      @blog_post.summary = ""
      expect(@blog_post).to_not be_valid

      @blog_post.pub_status = ""
      expect(@blog_post).to_not be_valid
    end
  end
end
