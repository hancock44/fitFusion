class CreateNutritionLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrition_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :calories_current
      t.float :sleep_current
      t.integer :protein_current
      t.integer :calories_max
      t.float :sleep_max
      t.integer :protein_max

      t.timestamps
    end
  end
end
