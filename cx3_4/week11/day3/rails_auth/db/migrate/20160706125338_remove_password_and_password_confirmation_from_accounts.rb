class RemovePasswordAndPasswordConfirmationFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :password, :string
    remove_column :accounts, :password_confirmation, :string
  end
end
