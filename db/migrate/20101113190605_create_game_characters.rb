class CreateGameCharacters < ActiveRecord::Migration
  def self.up
    create_table :game_characters do |t|
      t.string :asset
      t.integer :min_level
      t.timestamps
    end
  end

  def self.down
    drop_table :game_characters
  end
end
