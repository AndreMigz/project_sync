class CreateTimeLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :time_logs do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_date
      t.string :status

      t.timestamps
    end
  end
end
