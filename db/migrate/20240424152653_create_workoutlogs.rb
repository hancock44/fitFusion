class CreateWorkoutlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :workoutlogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :day
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
