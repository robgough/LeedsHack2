class AddHistoryDaysToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :history_days, :integer
  end

  def self.down
    remove_column :users, :history_days
  end
end
