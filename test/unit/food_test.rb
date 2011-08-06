require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: foods
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  food       :string(255)
#  calories   :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

