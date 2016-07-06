class Address < ActiveRecord::Base

  belongs_to :user

  validates :address_line_one, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :state, length: { is: 2 }
  validates :postal_code, presence: true
  validates :postal_code, length: { is: 5 }

end