class AddUserAsReferenceToRelatedModels < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :user, null: true, foreign_key: true
    add_reference :tasks, :user, null: true, foreign_key: true
    add_reference :time_logs, :user, null: true, foreign_key: true
  end
end
