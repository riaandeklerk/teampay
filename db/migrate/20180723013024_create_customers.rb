class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :stripe_id
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
