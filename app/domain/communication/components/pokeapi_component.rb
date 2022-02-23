class Communication::Components::PokeapiComponent
  def initialize(components = {})
    @rest_client = components.fetch(:rest_client) { Communication::RestClient.new }
  end

  def get_info(pokemon_name)
    response = @rest_client.get('https://pokeapi.co/api/v2/pokemon/' + pokemon_name, {})
    response.body
  end
end
