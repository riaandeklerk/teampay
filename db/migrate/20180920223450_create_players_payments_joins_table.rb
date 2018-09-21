class CreatePlayersPaymentsJoinsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :payments_players, id: false do |t|
      t.belongs_to :payment, index: true
      t.belongs_to :player, index: true
    end
  end
end
