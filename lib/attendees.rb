class Attendee < ActiveRecord::Base
  has_many :favorites
  has_many :artists, through: :favorites
  validates :name, {:presence => true}
  validates :username, {:presence => true, :uniqueness => true, :length => {in: 6..15}}
  validates :password, {:presence => true, :format => {:with => /\A(\w*(\d+[a-zA-Z]|[a-zA-Z]+\d)\w*)+\z/}, :length => {in: 6..15}}
  before_save :capitalize_name

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end

  def authenticate
    self['password'] == params['password']
  end
end
