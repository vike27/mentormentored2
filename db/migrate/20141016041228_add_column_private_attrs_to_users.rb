class AddColumnPrivateAttrsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :private_attrs, :string
  end
end
