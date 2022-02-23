class Pokemon::Adapters::Out::PokemonAdapter
  def self.adapt_pokemon_info(pokemon_data)
    if pokemon_data != 'Not Found'
      pokemon_json = JSON.parse(pokemon_data)
      response = {
        status: 200,
        pokemon_info: {
          abilities: pokemon_json['abilities'].map { |ability| ability['ability']['name'] }.sort
        }
      }
    else
      response = {
        status: 404,
        pokemon_info: pokemon_data
      }
    end
  end
end
