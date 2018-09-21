class RemoveCustomerReferenceOnUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :customer_id, :integer
  end
end
