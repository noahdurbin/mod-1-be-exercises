require './lib/player'
require './lib/team'
require 'pry'

RSpec.describe Team do
    it 'can create a new team' do
        team_1 = Team.new("France")

        expect(team_1).to be_a(Team)
    end

    it 'team initializes with a country' do
        team = Team.new("France")

        expect(team.country).to eq("France")
    end

    it 'team to start off not eliminated' do
        team = Team.new("France")

        expect(team.eliminated?).to eq(false)
    end

    it 'can be eliminated' do
        team = Team.new("France")
        team.eliminated

        expect(team.eliminated?).to eq(true)
    end

    it 'team starts out with no players' do
        team = Team.new("France")

        expect(team.players).to eq([])
    end

    it ' - team can add players to the team' do
        team = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

        team.add_player(mbappe)
        team.add_player(pogba)

        expect(team.players).to eq([mbappe, pogba])
    end

    it ' - can sort players by position' do
        team = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        team.add_player(mbappe)
        team.add_player(pogba)

        expect(team.players_by_position("midfielder")).to eq([pogba])
        expect(team.players_by_position("defender")).to eq([])
    end
end
