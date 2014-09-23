class AddColumnLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :industry, :string
    add_column :users, :location, :string
  end
end
