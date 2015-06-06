class Ingredient
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def weight
    if name.downcase.include?("brussel")
      20
    elsif name.downcase.include?("cheesy")
      0.5
    end
  end
end

class Container
  def initialize(type)
    @type = type
  end

  def type
    @type.name
  end

  def quantity
    if type.downcase.include?("brussel")
      (136078 / @type.weight).floor
    elsif type.downcase.include?("cheesy")
      (9071.85 / @type.weight).floor
    end
  end

  def weight
    if type.downcase.include?("brussel")
      (200 + quantity * 0.0440925)
    elsif type.downcase.include?("cheesy")
      (50 + quantity * 0.00110231)
    end
  end
end

class Airplane
  attr_accessor :type

  def initialize(type)
    @type = type
    @capacity = capacity
  end

  def capacity
    if type.downcase.include?("concorde")
      20000
    elsif type.downcase.include?("747")
      116800
    elsif type.downcase.include?("787")
      104460
    end
  end

  def cargo(ingredient, weight)
    if ingredient.name.downcase.include?("brussel")
      cheesy_poofs = Ingredient.new("Cheesy Poofs")
      cheesy_container = Container.new(cheesy_poofs)
      brussels_container = Container.new(ingredient)

      num_brussels = (weight / 0.0440925)
      num_containers = (num_brussels / brussels_container.quantity).ceil
      brussels_containers_weight = num_containers * 200

      @capacity -= (brussels_containers_weight + (num_brussels * ingredient.weight * 0.00220462))

      possible_cheesy_containers = (capacity / cheesy_container.weight).floor
      possible_num_cheesy_poofs = possible_cheesy_containers * cheesy_container.quantity

      "Airplane type: #{type}\n" +
      "#{weight} pounds of #{ingredient.name} loaded into #{num_containers} container(s) holding #{num_brussels.floor} Brussel Sprouts!\n" +
      "Total weight of container(s): #{brussels_containers_weight + weight} lbs.\n" +
      "Remaining cargo capacity: #{capacity.round} lbs.\n" +
      "There's room for #{possible_cheesy_containers} more container(s) holding #{possible_num_cheesy_poofs} Cheesy Poofs!\n\n"
    elsif ingredient.name.downcase.include?("cheesy")
      cheesy_container = Container.new(ingredient)
      brussels = Ingredient.new("Brussel Sprouts")
      brussels_container = Container.new(brussels)

      num_cheesy_poofs = (weight / 0.00110231)
      num_containers = (num_cheesy_poofs / cheesy_container.quantity).ceil
      cheesy_poofs_containers_weight = num_containers * 50

      @capacity -= (cheesy_poofs_containers_weight + (num_cheesy_poofs * ingredient.weight * 0.00220462))

      possible_brussels_containers = (capacity / brussels_container.weight).floor
      possible_num_brussels = possible_brussels_containers * brussels_container.quantity

      "Airplane type: #{type}\n" +
      "#{weight} pounds of #{ingredient.name} loaded into #{num_containers} container(s) holding #{num_cheesy_poofs.floor} Cheesy Poofs!\n" +
      "Total weight of container(s): #{cheesy_poofs_containers_weight + weight} lbs.\n" +
      "Remaining cargo capacity: #{capacity.round} lbs.\n" +
      "There's room for #{possible_brussels_containers} more container(s) holding #{possible_num_brussels} Brussel Sprouts!\n\n"
    end
  end
end

cheesy_poofs = Ingredient.new("Cheesy Poofs")
cheesy_poofs_container = Container.new(cheesy_poofs)
brussel_sprouts = Ingredient.new("Brussel Sprouts")
brussel_sprouts_container = Container.new(brussel_sprouts)

concorde = Airplane.new("Concorde")
b747 = Airplane.new("747")
b787 = Airplane.new("787")
puts concorde.cargo(cheesy_poofs, 5000)
puts b747.cargo(cheesy_poofs, 5000)
puts b787.cargo(cheesy_poofs, 5000)

concorde = Airplane.new("Concorde")
b747 = Airplane.new("747")
b787 = Airplane.new("787")
puts concorde.cargo(cheesy_poofs, 1000)
puts b747.cargo(cheesy_poofs, 1000)
puts b787.cargo(cheesy_poofs, 1000)

concorde = Airplane.new("Concorde")
b747 = Airplane.new("747")
b787 = Airplane.new("787")
puts concorde.cargo(brussel_sprouts, 5847)
puts b747.cargo(brussel_sprouts, 5847)
puts b787.cargo(brussel_sprouts, 5847)

concorde = Airplane.new("Concorde")
b747 = Airplane.new("747")
b787 = Airplane.new("787")
puts concorde.cargo(brussel_sprouts, 356)
puts b747.cargo(brussel_sprouts, 356)
puts b787.cargo(brussel_sprouts, 356)
