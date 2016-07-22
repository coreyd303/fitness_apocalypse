module Admin
  class DashboardController < Admin::BaseController
    def index
      @posts = BlogPost.all
      render "admin/blog_posts/index", layout: "admin/dashboard_base"
    end

    def wods_index
      @wods = Wod.all
      render "admin/wods/index", layout: "admin/dashboard_base"
    end
  end
end