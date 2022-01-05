# frozen_string_literal: true

require "./test_helper"

class UrygemTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Urygem::VERSION
  end

  def test_fetch_all_pokemons
    VCR.use_cassette("pokemons") do
      all_pokemon = Urygem.pokemons
      assert_instance_of Array, all_pokemon
      assert_instance_of Hash, all_pokemon.first
    end
  end

  def test_fetch_pokemon
    VCR.use_cassette("pokemon") do
      pokemon = Urygem.pokemon(1)
      assert_instance_of Hash, pokemon
      assert_equal "bulbasaur", pokemon[:name]
    end
  end

  def test_fetch_all_encounter_method
    VCR.use_cassette("encounter_method") do
      encounter_method = Urygem.encounter_method(1)
      assert_instance_of Hash, encounter_method
    end
  end
end
