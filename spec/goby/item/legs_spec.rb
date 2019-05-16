# frozen_string_literal: true

require 'goby'

RSpec.describe Legs do

  context "constructor" do
    it "has the correct default parameters" do
      legs = Legs.new
      expect(legs.name).to eq "Legs"
      expect(legs.price).to eq 0
      expect(legs.consumable).to eq false
      expect(legs.disposable).to eq true
      expect(legs.type).to eq :legs
    end

    it "correctly assigns custom parameters" do
      pants = Legs.new(name: "Pants",
                       price: 20,
                       consumable: true,
                       disposable: false,
                       stat_change: {attack: 2, defense: 2})
      expect(pants.name).to eq "Pants"
      expect(pants.price).to eq 20
      expect(pants.consumable).to eq true
      expect(pants.disposable).to eq false
      expect(pants.stat_change[:attack]).to eq 2
      expect(pants.stat_change[:defense]).to eq 2
      # Cannot be overwritten.
      expect(pants.type).to eq :legs
    end
  end

end
