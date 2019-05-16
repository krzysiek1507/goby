# frozen_string_literal: true

require 'goby'

RSpec.describe Use do

  let(:use) { Use.new }

  context "constructor" do
    it "has an appropriate default name" do
      expect(use.name).to eq "Use"
    end
  end

  context "run" do
    let(:player) { Player.new(stats: { max_hp: 10, hp: 3 },
                           battle_commands: [@use],
                           inventory: [C[Food.new(recovers: 5), 1]]) }
    let(:monster) { Monster.new }

    it "uses the specified item and remove it from the entity's inventory" do
      # RSpec input example. Also see spec_helper.rb for __stdin method.
      __stdin("food\n", "player\n") do
        use.run(player, monster)
        expect(player.stats[:hp]).to eq 8
        expect(player.inventory.empty?).to be true
      end
    end

    it "has no effect when the user chooses to pass" do
      __stdin("pass\n") do
        use.run(player, monster)
        expect(player.inventory.empty?).to be false
      end
    end
  end

  context "fails?" do

    let(:entity) { Entity.new }

    it "returns true when the user's inventory is empty" do
      expect(use.fails?(entity)).to be true
    end

    it "returns false when the user has at least one item" do
      entity.add_item(Item.new)
      expect(use.fails?(entity)).to be false
    end
  end

end
