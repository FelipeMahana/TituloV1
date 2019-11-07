class RemoveDataFromContracts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contracts, :activity_level, :integer
    remove_column :contracts, :bmi, :float
    remove_column :contracts, :disease, :string
    remove_column :contracts, :allergies, :string
    remove_column :contracts, :bmr, :float
    remove_column :contracts, :karvonen, :string
    remove_column :contracts, :heart_rate, :integer
  end
end
