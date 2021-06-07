class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.text :remarks
      t.boolean :is_system
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
