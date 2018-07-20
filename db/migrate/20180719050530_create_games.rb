class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.date :game_date
      t.string :team
      t.decimal :cost

      t.timestamps
    end
  end
end
