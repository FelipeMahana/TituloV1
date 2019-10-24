class AddCoachToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :coach_mail, :string
    add_column :programs, :coach_name, :string
  end
end
