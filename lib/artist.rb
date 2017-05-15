class Artist < ActiveRecord::Base


  has_many :performances


  has_and_belongs_to_many :attendees
  has_many :performances

  has_many :stages, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
end
