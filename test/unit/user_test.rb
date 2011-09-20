require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  email            :string(255)
#  password_hash    :string(255)
#  password_salt    :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  next_goal_weight :float
#  name             :string(255)
#  daily_calories   :string(255)
#  public_profile   :boolean         default(TRUE)
#  history_days     :integer
#

