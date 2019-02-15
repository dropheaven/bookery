class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.date :release_date
      t.belongs_to :author, index: true
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
