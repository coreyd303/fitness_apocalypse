module Admin
  class BlogPostsController < BaseController
    def index
      @blogs = BlogPosts.all
    end

    def new
      @blog = BlogPost.new
    end

    def create
      if @blog = BlogPost.create(blog_params)
        flash[:notice] = "Blog post was create."
        render :edit
      else
        flash[:alert] = "Blog post could not be created."
        render :new
    end

    def edit
      @blog = BlogPost.find(params[:id])
    end

    def update
      @blog = BlogPost.find(params[:id])
      if @blog.update(blog_params)
        flash[:notice] = "Success, blog post was updated."
        render :edit
      else
        flash[:alert] = "Blog could not be updated."
        render :edit
      end
    end

    private

    def blog_params
      params.require(:blog_post).permit(:title, :user_id, :body, :summary)
    end
  end
end