class Artist < ActiveRecord::Base



  has_many :stages, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
end
