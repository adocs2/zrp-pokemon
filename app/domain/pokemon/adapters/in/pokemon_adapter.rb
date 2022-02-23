class Pokemon::Adapters::In::PokemonAdapter
  def self.adapt_pokemon_name(params)
    params[:pokemon_name].downcase
  end
end
