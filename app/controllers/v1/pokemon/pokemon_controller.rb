class V1::Pokemon::PokemonController < ApplicationController
  def get_info
    response = Pokemon::Adapters::In::PokemonAdapter.adapt_pokemon_name(params)
                                                    .then { |pokemon_name| Pokemon::Services::PokemonService.new.get_info(pokemon_name) }
                                                    .then { |service_response| Pokemon::Adapters::Out::PokemonAdapter.adapt_pokemon_info(service_response) }

    render json: { status: response[:status], result: response[:pokemon_info] }, status: :ok
  end
end
