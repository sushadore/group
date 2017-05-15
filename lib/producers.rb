class Producer < ActiveRecord::Base
  validates :name, {:presence => true, :uniqueness => true}
  validates :username, {:presence => true, :uniqueness => true, :length => {in: 6..15}}
  validates :password, {:presence => true, :format => {:with => /\A(\z=.*[a-zA-Z])(\z=.*[0-9]).{6..15}\z/, message: "must be between 6 and 15 characters and include one number and one letter."}}
  before_save :capitalize_name

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
