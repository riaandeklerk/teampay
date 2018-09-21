class AddLeagueAndActivatedAtToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :league, :string
    add_column :games, :activated_at, :datetime
  end
end
