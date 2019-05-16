# frozen_string_literal: true

require 'goby'

RSpec.describe Helmet do

  context "constructor" do
    it "has the correct default parameters" do
      helmet = Helmet.new
      expect(helmet.name).to eq "Helmet"
      expect(helmet.price).to eq 0
      expect(helmet.consumable).to eq false
      expect(helmet.disposable).to eq true
      expect(helmet.type).to eq :helmet
    end

    it "correctly assigns custom parameters" do
      big_hat = Helmet.new(name: "Big Hat",
                           price: 20,
                           consumable: true,
                           disposable: false,
                           stat_change: {attack: 2, defense: 2})
      expect(big_hat.name).to eq "Big Hat"
      expect(big_hat.price).to eq 20
      expect(big_hat.consumable).to eq true
      expect(big_hat.disposable).to eq false
      expect(big_hat.stat_change[:attack]).to eq 2
      expect(big_hat.stat_change[:defense]).to eq 2
      # Cannot be overwritten.
      expect(big_hat.type).to eq :helmet
    end
  end

end
