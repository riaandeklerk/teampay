class UpdateStripeIdTypeInCustomers < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :stripe_id, :string
  end
end
