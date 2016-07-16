class Profile < ActiveRecord::Base
  belongs_to :user

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :age, presence: true
end
