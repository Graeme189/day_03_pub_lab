# frozen_string_literal: true

class Drinks
  attr_reader :name, :price, :units

  def initialize(name, price, units)
    @name = name
    @price = price
    @units = units
  end
end
