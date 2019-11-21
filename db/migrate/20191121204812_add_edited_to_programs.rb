class AddEditedToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :edited, :boolean, default: false
  end
end
