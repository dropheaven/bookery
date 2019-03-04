class RemoveNameFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :first_name, :string
    remove_column :authors, :middle_name, :string
    remove_column :authors, :last_name, :string
    add_column :authors, :full_name, :string
  end
end
