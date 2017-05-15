class Favorite < ActiveRecord::Base
  belongs_to :artist
  belongs_to :attendee
end
