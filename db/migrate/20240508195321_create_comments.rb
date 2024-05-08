class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :post_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
