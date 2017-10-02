class Patient < ApplicationRecord
  has_many :appointments

  validates :name, presence: true
end
