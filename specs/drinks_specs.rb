# frozen_string_literal: true

require('minitest/autorun')
require('minitest/rg')

require_relative('../drinks.rb')

class TestDrinks < MiniTest::Test
  def setup
    @drink1 = Drinks.new('IPA', 5, 2)

    @stock = Drinks.new(
      {name: "IPA", price: 5},
      {name: "Wine", price: 8},
    )
  end

  def test_name_and_price_of_drink
    assert_equal('IPA', @drink1.name)
    assert_equal(5, @drink1.price)
  end

  def test_return_units
    assert_equal(2, @drink1.units)
  end
end
