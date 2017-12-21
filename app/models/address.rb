class Address < ApplicationRecord
  belongs_to :address_type
  belongs_to :employee, required: false
  belongs_to :status
  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: {only_integer: true}, length: {is: 5}
end
