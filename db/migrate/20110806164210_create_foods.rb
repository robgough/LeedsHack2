class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.integer :user_id
      t.string :food
      t.integer :calories
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
