# frozen_string_literal: true

class Pub
  attr_reader :name, :till

  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
  end

  def count_stock
    @drinks.count
  end

  def add_stock(stock)
    @drinks <<  stock
  end

  def sell_drink(booze, price)
    @drinks.delete(booze)
    @till += price
  end

  # def add_to_till(price)
  #   @till += price
  # end

  def check_customer_age(age)
    if age >= 18
      'Come on in!'
    else
      'Beat it pal!'
    end
  end

  def check_customer_drunkeness(sobriety)
    if sobriety > 10
      "You've had too much pal!"
    else
      'What you having?'
    end
  end
end
