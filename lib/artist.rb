class Artist < ActiveRecord::Base

  has_many :performances

  has_many :stages, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
end
