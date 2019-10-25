class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.date :date
      t.integer :cincuenta_mts
      t.integer :cien_mts
      t.integer :doscientos_mts
      t.integer :cuatrocientos_mts
      t.integer :ochocientos_mts
      t.integer :mil_quinientos_mts
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
