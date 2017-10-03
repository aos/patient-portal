class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :start, :end, presence: true
end
