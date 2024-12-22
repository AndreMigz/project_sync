class Task < ApplicationRecord
  belongs_to :project
  has_many :time_logs, dependent: :destroy

  validates :name, presence: true

  def active_time_log
    time_logs.where(status: :ongoing).last
  end
end
