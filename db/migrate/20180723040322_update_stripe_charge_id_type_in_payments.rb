class UpdateStripeChargeIdTypeInPayments < ActiveRecord::Migration[5.1]
  def change
    change_column :payments, :stripe_charge_id, :string
  end
end
