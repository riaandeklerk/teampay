class RenamePlayerIdInPlayersPaymentsJoinsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :payments_players, :player_id, :user_id
  end
end
