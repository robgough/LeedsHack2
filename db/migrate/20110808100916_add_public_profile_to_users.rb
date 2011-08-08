class AddPublicProfileToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :public_profile, :boolean, :default => 1
  end

  def self.down
    remove_column :users, :public_profile
  end
end
