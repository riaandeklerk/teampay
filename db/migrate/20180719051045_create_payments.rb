class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :administrator_id

      t.timestamps
    end
  end
end
