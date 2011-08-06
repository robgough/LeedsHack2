class CreateWeightTable < ActiveRecord::Migration
  def self.up
    create_table :weights do |t|
      t.integer :user_id
      t.float :pounds
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :weights
  end
end
