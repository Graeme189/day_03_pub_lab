# frozen_string_literal: true

require('minitest/autorun')
require('minitest/rg')

require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drinks.rb')
require_relative('../food.rb')

class TestPub < MiniTest::Test
  def setup
    @drink1 = Drinks.new('IPA', 5, 2)
    @pub = Pub.new('Yellow Sun Bar', 100)
    @customer = Customer.new('John', 10, 33, 4)
    @underage_customer = Customer.new('Jarred', 10, 17, 0)
    @drunk_customer = Customer.new('Juan', 2, 22, 23)
    @food = Food.new('burger', 2, 1)

    @stock = {
      IPA: 5,
      Wine: 8,
    }
  end

  def test_return_pub_name
    assert_equal('Yellow Sun Bar', @pub.name)
  end

  def test_return_till_amount
    assert_equal(100, @pub.till)
  end

  def test_count_stock
    assert_equal(0, @pub.count_stock)
  end

  def test_add_stock_to_bar
    @pub.add_stock(@stock[:IPA])
    assert_equal(1, @pub.count_stock)
  end

  def test_sell_drink
    @pub.add_stock(@drink1)
    @pub.sell_drink(@drink1, @drink1.price)
    @customer.pay_for_drink(@drink1.price)
    assert_equal(5, @customer.wallet)
    assert_equal(0, @pub.count_stock)
    assert_equal(105, @pub.till)
    assert_equal(true, @pub.check_customer_age(@customer.age))
    assert_equal(6, @customer.increase_drunkeness(@drink1.units))
    assert_equal(false, @pub.check_customer_drunkeness(@customer.drunkeness))
  end

  def test_no_sell_drink_underage
    @pub.add_stock(@drink1)
    assert_equal(false, @pub.check_customer_age(@underage_customer.age))
    assert_equal(10, @underage_customer.wallet)
    assert_equal(1, @pub.count_stock)
    assert_equal(100, @pub.till)
    assert_equal(0, @underage_customer.drunkeness)
  end

  def test_no_sell_to_waster
    @pub.add_stock(@drink1)
    assert_equal(1, @pub.count_stock)
    assert_equal(true, @pub.check_customer_drunkeness(@drunk_customer.drunkeness))
  end

  def test_check_customer_age
    assert_equal(true, @pub.check_customer_age(@customer.age))
  end

  def test_customer_drunkeness_levels
    assert_equal(false, @pub.check_customer_drunkeness(@customer.drunkeness))
  end

  def test_pub_sells_food
    @pub.sell_food(@food.price)
    @customer.sobering_up(@food.rejuvenation_levels)
    assert_equal(102, @pub.till)
    assert_equal(3, @customer.drunkeness)
  end

end
