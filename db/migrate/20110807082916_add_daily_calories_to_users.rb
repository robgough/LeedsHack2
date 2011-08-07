class AddDailyCaloriesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :daily_calories, :string
  end

  def self.down
    remove_column :users, :daily_calories
  end
end
