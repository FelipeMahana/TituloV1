class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.integer :hundred_mts
      t.integer :two_hundred_mts
      t.integer :three_hundred_mts
      t.integer :four_hundred_mts
      t.integer :eight_hundred_mts
      t.integer :thousand_mts
      t.integer :thousand_five_hundred_mts
      t.integer :cooper_test
      t.integer :squat_rm

      t.timestamps
    end
  end
end
