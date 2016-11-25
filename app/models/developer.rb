class Developer < ActiveRecord::Base
  has_many :projects

  validates :first_name, presence: true
  validates :last_name, presence: true
end