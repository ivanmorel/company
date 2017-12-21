class Position < ApplicationRecord
  belongs_to :status
  validates :name, presence: true
end
