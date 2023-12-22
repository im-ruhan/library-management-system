class CreateFines < ActiveRecord::Migration[7.0]
  def change
    create_table :fines do |t|
      t.references :borrower, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
