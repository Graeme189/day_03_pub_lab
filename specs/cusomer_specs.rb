# frozen_string_literal: true

require('minitest/autorun')
require('minitest/rg')

require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drinks.rb')

class TestCustomer < MiniTest::Test
  def setup
    @customer = Customer.new('John', 10, 33, 0)

    @drink1 = Drinks.new('IPA', 5, 2)
  end

  def test_return_customer_name
    assert_equal('John', @customer.name)
  end

  def test_return_wallet_amount
    assert_equal(10, @customer.wallet)
  end

  def test_return_age
    assert_equal(33, @customer.age)
  end

  def test_pay_for_drink
    @customer.pay_for_drink(@drink1.price)
    assert_equal(5, @customer.wallet)
  end

  def test_return_drunkeness_level
    assert_equal(0, @customer.drunkeness)
  end

  def test_increase_drunkeness
    @customer.increase_drunkeness(@drink1.units)
    assert_equal(2, @customer.drunkeness)
  end


end
