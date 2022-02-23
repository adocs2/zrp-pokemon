require 'rails_helper'

describe V1::Pokemon::PokemonController, type: :request do
  context 'GET Pokemon info' do
    it 'returns a successful response' do
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

      pokemon_data = {
        "abilities": [
          {
            "ability": {
              "name": 'limber',
              "url": 'https://pokeapi.co/api/v2/ability/7/'
            },
            "is_hidden": false,
            "slot": 1
          },
          {
            "ability": {
              "name": 'imposter',
              "url": 'https://pokeapi.co/api/v2/ability/150/'
            },
            "is_hidden": true,
            "slot": 3
          }
        ],
      }.to_json

      @rest_client = double('rest_client')
      allow_any_instance_of(Pokemon::Services::PokemonService).to receive(:get_info).and_return(pokemon_data)

      get '/v1/pokemon/info/ChaRmAndEr', headers: @auth_headers
      result = JSON.parse(response.body)
      expect(response).to be_successful
      expect(result["status"]).to be(200)
      expect(result["result"]).to eql("abilities" => %w[imposter limber])
    end
  end
end
