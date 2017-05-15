class Attendee < ActiveRecord::Base

  has_many :artists, dependent: :destroy
  validates :name, {:presence => true, :uniqueness => true}
  before_save :capitalize_name
  

  has_and_belongs_to_many :artists, dependent: :destroy
  validates :name, {:presence => true}
  validates :username, {:presence => true, :uniqueness => true, :length => {in: 6..15}}
  validates :password, {:presence => true, :format => {:with => /\A(\w*(\d+[a-zA-Z]|[a-zA-Z]+\d)\w*)+\z/}, :length => {in: 6..15}}
  before_save :capitalize_name


private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
