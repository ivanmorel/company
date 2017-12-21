class Phone < ApplicationRecord
  belongs_to :phone_type
  belongs_to :employee, required: false
  belongs_to :status
  validates :phone, presence: true
  validates :phone, numericality: {only_integer: true}, length: {is: 10}
end
