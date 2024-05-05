class AddStatusToWorkoutLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :workout_logs, :status, :string, default:"private"
  end
end
