class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
	add_column :users, :twitter, :text
	add_column :users, :monday, :boolean
	add_column :users, :mondaytime1, :text
	add_column :users, :mondaytime2, :text
	add_column :users, :tuesday, :boolean
	add_column :users, :tuesdaytime1, :text
	add_column :users, :tuesdaytime2, :text
	add_column :users, :wednesday, :boolean
	add_column :users, :wednesdaytime1, :text
	add_column :users, :wednesdaytime2, :text
	add_column :users, :thursday, :boolean
	add_column :users, :thursdaytime1, :text
	add_column :users, :thursdaytime2, :text
	add_column :users, :friday, :boolean
	add_column :users, :fridaytime1, :text
	add_column :users, :fridaytime2, :text
	add_column :users, :saturday, :boolean
	add_column :users, :saturdaytime1, :text
	add_column :users, :saturdaytime2, :text
	add_column :users, :sunday, :boolean
	add_column :users, :sundaytime1, :text
	add_column :users, :sundaytime2, :text
  end
end
