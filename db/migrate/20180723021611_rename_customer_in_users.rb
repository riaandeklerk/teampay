class RenameCustomerInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :payments, :player_id, :customer_id
  end
end
