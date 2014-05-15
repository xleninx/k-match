class AddCancelAccountTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cancel_account_token, :string
  end
end
