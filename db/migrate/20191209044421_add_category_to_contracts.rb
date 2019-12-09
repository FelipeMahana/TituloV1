class AddCategoryToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :category, :string
  end
end
