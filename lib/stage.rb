class Stage < ActiveRecord::Base
  has_many :artists, through: :performances
  validates :name, {:presence => true, :uniqueness => true}
  before_save :capitalize_name

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
