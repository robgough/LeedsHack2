class AddNextGoalWeightToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :next_goal_weight, :float
  end

  def self.down
  	remove_column :users, :next_goal_weight
  end
end
