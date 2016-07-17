module Admin
  class WodsController < ApplicationController
    def index
      @wods = Wod.all
    end

    def new
      @wod = Wod.new
    end

    def create
      @wod.create(wod_params)
    end

    def edit
    end

    def update
    end

    private

    def wod_params
      params.require(:wod).permit(:duration, :workout_type, :workout)
    end
  end
end
