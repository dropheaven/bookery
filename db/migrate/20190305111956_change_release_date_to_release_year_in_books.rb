class ChangeReleaseDateToReleaseYearInBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :release_date, :integer
    rename_column :books, :release_date, :release_year
  end
end
