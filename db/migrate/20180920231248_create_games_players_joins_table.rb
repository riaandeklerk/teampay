class CreateGamesPlayersJoinsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :games_players, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :player, index: true
    end
  end
end
