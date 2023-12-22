class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.references :library, null: false, foreign_key: true
      t.boolean :available, default: true
      t.date :due_date

      t.timestamps
    end
  end
end
