class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :position
  belongs_to :status
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
