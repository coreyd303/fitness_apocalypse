# == Schema Information
#
# Table name: wods
#
#  id           :integer          not null, primary key
#  duration     :integer
#  workout_type :string
#  workout      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Wod < ActiveRecord::Base
end
