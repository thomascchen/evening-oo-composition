require_relative '../../lib/code'

describe Ingredient do
  let(:brussel_sprouts) { Ingredient.new("Brussel Sprouts") }
  let(:cheesy_poofs) { Ingredient.new("Cheesy Poofs") }

  it 'is an Ingredient' do
    expect(brussel_sprouts).to be_a Ingredient
  end

  describe '#name' do
    it 'has a name' do
      expect(brussel_sprouts.name).to eql("Brussel Sprouts")
    end
  end

  describe '#weight' do
    it 'has a weight of 20 if Brussel Sprouts' do
      expect(brussel_sprouts.weight).to eql(20)
    end

    it 'has a weight of 0.5 if Cheesy Poofs' do
      expect(cheesy_poofs.weight).to eql(0.5)
    end
  end
end

describe Container do
  let(:brussel_sprouts) { Ingredient.new("Brussel Sprouts") }
  let(:brussels_container) { Container.new(brussel_sprouts) }
  let(:cheesy_poofs) { Ingredient.new("Cheesy Poofs") }
  let(:cheesy_container) { Container.new(cheesy_poofs) }

  it 'is a Container' do
    expect(brussels_container).to be_a Container
  end

  describe '#type' do
    it 'has a type of Brussel Sprouts' do
      expect(brussels_container.type).to eql("Brussel Sprouts")
    end

    it 'has a type of Cheesy Poofs' do
      expect(cheesy_container.type).to eql("Cheesy Poofs")
    end
  end

  describe '#quantity' do
    it 'has a quantity of ingredients' do
      expect(brussels_container.quantity).to be_a Integer
    end

    it 'contains 6803 Brussel Sprouts' do
      expect(brussels_container.quantity).to eql(6803)
    end

    it 'contains 18143 Cheesy Poofs' do
      expect(cheesy_container.quantity).to eql(18143)
    end
  end

  describe '#weight' do
    it 'has a weight' do
      expect(brussels_container.weight).to be_a Float
    end

    it 'has a max weight of 500 lbs if Brussel Sprouts' do
      expect(brussels_container.weight).to be < 500
    end

    it 'has a max weight of 70 lbs if Cheesy Poofs' do
      expect(cheesy_container.weight).to be < 70
    end
  end
end

describe Airplane do
  let(:concorde) { Airplane.new("Concorde") }
  let(:cheesy_poofs) { Ingredient.new("Cheesy Poofs") }

  it 'is an airplane' do
    expect(concorde).to be_a Airplane
  end

  describe '#type' do
    it 'has a type' do
      expect(concorde.type).to eq("Concorde")
    end
  end

  describe '#capacity' do
    it 'has a max capacity' do
      expect(concorde.capacity).to be_a Integer
    end
  end

  describe '#cargo' do
    it 'tells us about cargo and remaining capacity' do
      cheesy_cargo = concorde.cargo(cheesy_poofs, 5000)
      expect(cheesy_cargo). to be_a String
    end
  end
end
