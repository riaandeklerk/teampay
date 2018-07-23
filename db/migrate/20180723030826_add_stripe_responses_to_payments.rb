class AddStripeResponsesToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :stripe_charge_id, :integer
    add_column :payments, :stripe_amount, :integer
    add_column :payments, :stripe_status, :string
    add_column :payments, :stripe_paid, :boolean
  end
end
