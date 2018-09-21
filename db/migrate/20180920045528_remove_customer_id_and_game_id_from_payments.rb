class RemoveCustomerIdAndGameIdFromPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :customer_id, :integer
    remove_column :payments, :game_id, :integer
  end
end
