module Admin
  class DashboardController < Admin::BaseController
    def index
      @posts = BlogPost.all
      render "admin/blog_post/index", layout: "admin/dashboard_base"
    end
  end
end