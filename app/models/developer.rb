class Developer < ActiveRecord::Base
  has_many :projects

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Developer's Avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def full_name
    return "#{first_name} #{last_name}"
  end
end
