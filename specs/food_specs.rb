require('minitest/autorun')
require('minitest/rg')

require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drinks.rb')
require_relative('../food.rb')

class TestFood < MiniTest::Test

  def setup
    @food = Food.new("burger", 2, 1)
  end

def test_return_food_name
  assert_equal("burger", @food.name)
end




end
