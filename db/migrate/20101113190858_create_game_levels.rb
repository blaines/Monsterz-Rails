class CreateGameLevels < ActiveRecord::Migration
  def self.up
    create_table :game_levels do |t|
      t.integer :order
      t.integer :max_health
      t.integer :max_turns
      t.integer :required_experience
      t.timestamps
    end
  end

  def self.down
    drop_table :game_levels
  end
end
