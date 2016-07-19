class HomeController < BaseController
  def index
    if current_user && Wod.count > 0
      date_to_string = Time.zone.now.strftime("%m/%d/%Y")
      @wod = Wod.find_by(workout_date: date_to_string)
    end

    @rest = "Rest and Recover today, if you're tired, relax, otherwise you can do a light recovery walk, strech, or ride."
  end
end