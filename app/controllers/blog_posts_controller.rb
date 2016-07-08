class BlogPostsController < ApplicationController
  def index
    @blogs = BlogPost.all
  end

  def show
    @blog = BlogPost.find(params[:id])
  end
end