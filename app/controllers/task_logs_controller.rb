class TaskLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [ :update ]
  def index
    @active_task = TimeLog.where(status: :ongoing).last
    @task_logs = TimeLog.where(status: :done).order(created_at: :desc)
  end

  def create
    task = Task.new(task_params)

    respond_to do |format|
      if task.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("task_frame", partial: "active_task", locals: { task: task })
        end
        format.html { redirect_to task_logs_path, notice: "Task created successfully." }
      else
        format.html { redirect_to task_logs_path, notice: "Failed to create task.", status: :unprocessable_entity }
      end
    end
  end

  def update
    time_log = @task.active_time_log
    if params[:stop]
      time_log.update(end_date: DateTime.now, status: :done)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("task_frame", partial: "form"),
            turbo_stream.prepend("tasks_logs", partial: "task", locals: { time_log: time_log })
          ]
        end
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :project_id)
  end

  def set_task
    @task = Task.find(params[:id])

    redirect_to task_logs_path, notice: "Task not found." unless @task
  end
end
