module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      unless current_user && current_user.has_role?(:admin)
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
      end
    end
  end
end