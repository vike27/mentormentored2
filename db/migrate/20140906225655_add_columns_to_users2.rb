class AddColumnsToUsers2 < ActiveRecord::Migration
  def change
  	add_column :users, :occupation, :string
  	add_column :users, :gender, :string
  	add_column :users, :work_history, :string
  	add_column :users, :years_of_experience, :number
  end
end
