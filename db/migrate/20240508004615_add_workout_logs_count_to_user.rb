class AddWorkoutLogsCountToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :workout_logs_count, :integer
  end
end
