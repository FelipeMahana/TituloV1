class DropBillingsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :billings
  end
end
