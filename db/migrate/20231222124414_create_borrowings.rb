class CreateBorrowings < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowings do |t|
      t.references :borrower, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :return_date

      t.timestamps
    end
  end
end
