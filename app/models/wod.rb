# == Schema Information
#
# Table name: wods
#
#  id           :integer          not null, primary key
#  duration     :string
#  workout_type :string
#  workout      :text
#  created_at   :datetime
#  updated_at   :datetime
#  title        :string
#  workout_date :string
#  pub_status   :string
#  start_time   :datetime
#

class Wod < ActiveRecord::Base
  validates :title,
            :duration,
            :workout_type,
            :workout,
            :workout_date,
            :pub_status, presence: true

  WORKOUT_TYPES = [ "Strength", "MetCon", "Run / RuckRun", "Dry Fire", "Live Fire", "Hero" ]
  REST_DAY = "Rest and Recover today, if you're tired, relax, otherwise you can do a light recovery walk, strech, or ride."

  def convert_to_start_time
    unless workout_date.blank?
      date = workout_date.gsub("/", "-")
      year = date.last(4)
      date.slice!(5..10)
      new_date = year + "-" + date
      self.start_time = new_date.to_datetime
    end
  end
end
