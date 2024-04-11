class WorldCup

    attr_reader :year,
                :countries

    def initialize(year, teams)
        @year = year
        @countries = teams
    end

    def teams
        @countries.find_all do |country|
            country.country
        end
    end

    def active_players_by_position(position)
        @countries.map do |team|
                team.players_by_position(position)  
        end.flatten
    end

    def sort_all_players_by_position
        @countries.map do |team|
           team.players_by_position 
        end
    end
end
