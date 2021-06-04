class CreateDebits < ActiveRecord::Migration[6.0]
  def change
    create_table :debits do |t|
      t.string :frequency
      t.string :currency
      t.text :remarks
      t.decimal :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
