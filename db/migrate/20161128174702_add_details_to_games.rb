class AddDetailsToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :handicap, :integer
    add_column :games, :komi, :decimal
  end
end
