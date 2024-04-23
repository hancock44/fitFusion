class CreateNutritionLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrition_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.integer :calories_consumed
      t.float :current_sleep_hours
      t.integer :protein_intake
      t.integer :max_calories
      t.integer :min_protein
      t.float :min_sleep

      t.timestamps
    end
  end
end
