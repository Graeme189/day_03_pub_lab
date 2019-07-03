# frozen_string_literal: true

class Drinks
  attr_reader :name, :price,

  def initialize(name, price)
    @name = name
    @price = price
    # @units = units
  end
end
