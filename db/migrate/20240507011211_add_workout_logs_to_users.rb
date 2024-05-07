class AddWorkoutLogsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :workout_logs_count, :integer
    add_column :users, :default, :string
    add_column :users, :0, :string
  end
end
