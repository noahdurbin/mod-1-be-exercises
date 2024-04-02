require './lib/world_cup'
require './lib/team'
require './lib/player'

RSpec.describe WorldCup do
    before do
        @france = Team.new("France")
        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        @france.add_player(@mbappe)
        @france.add_player(@pogba)
        @croatia = Team.new("Croatia")
        @modric = Player.new({name: "Luka Modric", position: "midfielder"})
        @vida = Player.new({name: "Domagoj Vida", position: "defender"})
        @croatia.add_player(@modric)
        @croatia.add_player(@vida)
        @world_cup = WorldCup.new(2018, [@france, @croatia])
    end

    it 'can recall the year of the world cup' do
       expect(@world_cup.year).to eq(2018)
    end

    it 'can say which teams are playing' do
        expect(@world_cup.teams).to eq([@france, @croatia])
    end

    it 'shows active players by position in the game' do
       expect(@world_cup.active_players_by_position("midfielder")).to eq(@pogba, @modric)
    end

    it 'eliminates specified team and removes their players from the world cup' do
        @croatia.eliminated
        expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba])
    end
end
