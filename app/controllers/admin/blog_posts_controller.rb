module Admin
  class BlogPostsController < BaseController
    def index
      @blog_posts = BlogPost.all
    end

    def new
      @blog_post = BlogPost.new
    end

    def create
      @blog_post = BlogPost.create(blog_params)
      if @blog_post.save
        flash[:notice] = "Blog post was create."
        redirect_to edit_admin_blog_post_path(@blog_post)
      else
        flash[:alert] = "Blog post could not be created."
        render :new
      end
    end

    def edit
      @blog_post = BlogPost.find(params[:id])
    end

    def update
      @blog_post = BlogPost.find(params[:id])
      if @blog_post.update(blog_params)
        flash[:notice] = "Success, blog post was updated."
        redirect_to edit_admin_blog_post_path(@blog_post)
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