class ChangeResultsTypeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :results, :hundred_mts, :float
    change_column :results, :two_hundred_mts, :float
    change_column :results, :three_hundred_mts, :float
    change_column :results, :four_hundred_mts, :float
    change_column :results, :eight_hundred_mts, :float
    change_column :results, :thousand_mts, :float
    change_column :results, :thousand_five_hundred_mts, :float
  end
end
