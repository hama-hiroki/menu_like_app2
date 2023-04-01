class AddGenreToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :genre, :string
  end
end
