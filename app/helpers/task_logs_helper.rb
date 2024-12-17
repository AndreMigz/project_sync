module TaskLogsHelper
  def time_spent(start_time, end_date)
    return "N/A" if start_time.nil? || end_date.nil?

    total_seconds = (end_date - start_time).to_i
    hours = total_seconds / 3600
    minutes = (total_seconds % 3600) / 60
    seconds = total_seconds % 60

    format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
