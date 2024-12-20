class TimeLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, :stop_active_time_log, only: %i[create]
  before_action :set_time_log, only: %i[destroy]

  def create
    time_log = @task.time_logs.new(start_time: DateTime.now, status: :ongoing)
    respond_to do |format|
      if time_log.save
        turbo_streams = [
          turbo_stream.replace("task_frame", partial: "task_logs/active_task", locals: { task: @task })
        ]

        # Add prepend only if @previous_log exists
        if @previous_log.present?
          turbo_streams << turbo_stream.prepend("tasks_logs", partial: "task_logs/task", locals: { time_log: @previous_log })
        end

        format.turbo_stream { render turbo_stream: turbo_streams }
        format.html { redirect_to task_logs_path, notice: "Task created successfully." }
      else
        format.html { redirect_to task_logs_path, notice: "Failed to create task.", status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @time_log.destroy
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@time_log) }
      end
    end
  end

  private

  def stop_active_time_log
    active_log = TimeLog.where(status: :ongoing).last
    return unless active_log

    active_log.update(end_date: DateTime.now, status: :done)
    @previous_log = active_log
  end

  def set_time_log
    @time_log = TimeLog.find(params[:id])

    redirect_to task_logs_path, notice: "Time log not found." unless @time_log
  end

  def set_task
    @task = Task.find(params[:task_id])

    redirect_to task_logs_path, notice: "Task not found." unless @task
  end
end
