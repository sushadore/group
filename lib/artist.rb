class Artist < ActiveRecord::Base
  has_many :favorites
  has_many :attendees, through: :favorites
  has_many :performances
  has_many :stages, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
  validates :bio, {:presence => true}
  validates :user_reviews, {:length => {in: 10..280}}
end
