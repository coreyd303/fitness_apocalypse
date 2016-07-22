class HomeController < BaseController
  def index
    if current_user && Wod.count > 0
      date_to_string = Time.zone.now.strftime("%m/%d/%Y")
      @wod = Wod.find_by(workout_date: date_to_string)
    end

    @rest = Wod::REST_DAY
  end
end