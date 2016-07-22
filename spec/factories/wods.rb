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

FactoryGirl.define do
  factory(:wod) do
    title  "my WOD"
    duration "30mins"
    workout_type "MetCon"
    workout "GO DO THINGS NOW!"
    workout_date "7/7/07"
    pub_status "P"
  end
end
