class HomeController < BaseController
  def index
    if current_user
      @wod = Wod.find_by(start_time: Time.zone.now.beginning_of_day).nil? ? Wod::REST_DAY : Wod.find_by(start_time: Time.zone.now.beginning_of_day)
    end
  end
end