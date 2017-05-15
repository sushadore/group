class Stage < ActiveRecord::Base
<<<<<<< HEAD

  has_many :performances

=======
  has_many :performances
>>>>>>> 1fbda4fe40f33b9d09e94f7bc8f7695bc1a303dc
  has_many :artists, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
  before_save :capitalize_name

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
