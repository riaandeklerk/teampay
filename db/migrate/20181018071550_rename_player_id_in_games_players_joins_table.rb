class RenamePlayerIdInGamesPlayersJoinsTable < ActiveRecord::Migration[5.1]
  def change
      rename_column :games_players, :player_id, :user_id
  end
end
