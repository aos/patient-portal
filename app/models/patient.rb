class Patient < ApplicationRecord
  has_many :appointments

  validates :name, :age, presence: true
end
