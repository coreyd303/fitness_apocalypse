class Profile < ActiveRecord::Base
  belongs_to :user

  validates :firstname, length: {minimum: 3}, presence: true
  validates :lastname, length: {minimum: 3}, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /@/
  validates :age, presence: true
  validates :yearshunting, presence: true
  validates :huntingstyle, presence: true
  validates :user_id, presence: true
end
