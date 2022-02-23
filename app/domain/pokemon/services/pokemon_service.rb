class Pokemon::Services::PokemonService
  def initialize(components = {})
    @pokeapi = components.fetch(:pokeapi_component) { Communication::Components::PokeapiComponent.new }
  end

  def get_info(pokemon_name)
    @pokeapi.get_info(pokemon_name)
  end
end
