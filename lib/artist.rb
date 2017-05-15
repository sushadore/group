class Artist < ActiveRecord::Base
<<<<<<< HEAD
=======
  has_many :performances
>>>>>>> e923f23cc3a396420e0ea1f8e30576f4aeecfa06
  has_many :stages, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
end
