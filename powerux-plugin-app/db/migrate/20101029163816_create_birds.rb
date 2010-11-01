class CreateBirds < ActiveRecord::Migration
  def self.up
    create_table :birds do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :birds
  end
end
