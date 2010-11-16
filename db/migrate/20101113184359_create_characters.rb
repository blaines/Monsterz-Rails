class CreateMonsters < ActiveRecord::Migration
  def self.up
    create_table :monsters do |t|
      t.integer :energy
      t.integer :level
      t.integer :turns
      t.string :type
      t.integer :health
      t.integer :experience
      t.timestamps
    end
  end

  def self.down
    drop_table :monsters
  end
end
