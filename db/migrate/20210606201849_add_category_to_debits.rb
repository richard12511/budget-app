class AddCategoryToDebits < ActiveRecord::Migration[6.0]
  def change
    add_reference :debits, :category, null: false, foreign_key: true
  end
end
