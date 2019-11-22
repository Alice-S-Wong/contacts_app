class Contact < ApplicationRecord
  validates :first_name, :last_name, presence: true
  # def friendly_updated_at
  #   updated_at.strftime("%A, %b %d")
  # end
  has_many :contact_groups
  has_many :groups, through: :contact_groups
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
  def phone_japanese_prefix
    "+81 #{phone_number}"
  end
end
