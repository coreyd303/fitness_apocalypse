class EventsController < ApplicationController
  def index
    @wods = Wod.all
  end
end
