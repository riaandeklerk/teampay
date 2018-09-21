class CreateGamesPaymentsJoinsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :games_payments, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :payment, index: true
    end
  end
end
