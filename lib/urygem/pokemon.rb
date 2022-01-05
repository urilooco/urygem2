module Urygem
  class Pokemon
    def initialize
      @client = Client.new("https://pokeapi.co/api/v2")
    end

    def list
      puts "🐲🐲 This is a list of only 20 pokemon, if you want to see more use the 'list_with_limits' endpoint 🐲🐲"
      response = client.get("/pokemon")
      results = response[:results]
      results
    end

    def list_with_limits(limit)
      response = client.get("/pokemon?limit=#{limit}")
      results = response[:results]
      results
    end

    def find(id_or_name)
      # client.get("/pokemon/#{id_or_name}")
      response = client.get("/pokemon/#{id_or_name}")

      raise "Pokemon not found" if response.nil?

      response
    end

    def encounter_method(id_or_name)
      response = client.get("/encounter-method/#{id_or_name}")

      raise "Encounter method not found" if response.nil?

      response
    end

    private

    attr_reader :client
  end
end
