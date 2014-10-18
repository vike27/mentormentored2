class ChangeColumnDefaultPrivateAttrsToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :private_attrs, []  )
  end
end
