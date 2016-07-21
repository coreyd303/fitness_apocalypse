class WodsController < ApplicationController
  def show
    @wod = Wod.find(params[:id])
  end
end
