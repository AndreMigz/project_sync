class Task < ApplicationRecord
  belongs_to :project
  has_many :time_logs, dependent: :destroy

  validates :name, presence: true

  after_create :create_time_log

  def active_time_log
    time_logs.where(status: :ongoing).last
  end


  private

  def create_time_log
    self.time_logs.create!(start_time: DateTime.now, status: :ongoing)
  end
end
