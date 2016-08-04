module Admin
  class WodsController < Admin::BaseController
    def index
      @wods = Wod.all
    end

    def new
      @wod = Wod.new
    end

    def create
      @wod = Wod.new(wod_params)
      @wod.convert_to_start_time
      if @wod.save
        flash[:notice] = "Your new WOD was created!"
        redirect_to edit_admin_wod_path(@wod)
      else
        flash[:alert] = "The WOD could not be saved."
        render :new
      end
    end

    def edit
      @wod = Wod.find(params[:id])
    end

    def update
      @wod = Wod.find(params[:id])
      @wod.convert_to_start_time
      if @wod.update(wod_params)
        flash[:notice] = "This WOD was updated!"
        redirect_to edit_admin_wod_path(@wod)
      else
        flash[:alert] = "This WOD could not be updated."
        render :edit
      end
    end

    private

    def wod_params
      params.require(:wod).permit(:pub_status, :workout_date, :duration, :workout_type, :workout, :start_time)
    end


  end
end
