# frozen_string_literal: true

require 'goby'

RSpec.describe Torso do

  context "constructor" do
    it "has the correct default parameters" do
      torso = Torso.new
      expect(torso.name).to eq "Torso"
      expect(torso.price).to eq 0
      expect(torso.consumable).to eq false
      expect(torso.disposable).to eq true
      expect(torso.type).to eq :torso
    end

    it "correctly assigns custom parameters" do
      shirt = Torso.new(name: "Shirt",
                        price: 20,
                        consumable: true,
                        disposable: false,
                        stat_change: {attack: 2, defense: 2})
      expect(shirt.name).to eq "Shirt"
      expect(shirt.price).to eq 20
      expect(shirt.consumable).to eq true
      expect(shirt.disposable).to eq false
      expect(shirt.stat_change[:attack]).to eq 2
      expect(shirt.stat_change[:defense]).to eq 2
      # Cannot be overwritten.
      expect(shirt.type).to eq :torso
    end
  end

end
