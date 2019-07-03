class Customer

attr_reader :name, :wallet, :age, :drunkeness

def initialize(name, wallet, age, drunkeness)
  @name = name
  @wallet = wallet
  @age = age
  @drunkeness = drunkeness
end

def pay_for_drink(cost)
  @wallet -= cost
end


def increase_drunkeness(units)
  @drunkeness += units
end

def sobering_up(calories)
  @drunkeness -= calories
end












end
