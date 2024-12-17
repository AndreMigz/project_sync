class TimeLog < ApplicationRecord
  belongs_to :task

  validates :start_time, presence: true
end
