class CreateWorkoutLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :regimen
      t.text :description

      t.timestamps
    end
  end
end
