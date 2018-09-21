class AddPayeeIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :payee_id, :integer
  end
end
