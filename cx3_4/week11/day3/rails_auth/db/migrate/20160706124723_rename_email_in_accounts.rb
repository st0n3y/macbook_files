class RenameEmailInAccounts < ActiveRecord::Migration[5.0]
  def change
    rename_column :accounts, :email, :name
  end
end
