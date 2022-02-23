require 'rails_helper'

describe Pokemon::Services::PokemonService do
  context 'when getting pokemon info' do
    it 'should return status 200 for Lockin type' do
      response = {
        "body" => {
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
        },
        "status" => 200
      }.to_json

      @rest_client = double('rest_client')
      allow(@rest_client).to receive(:get).and_return(OpenStruct.new(JSON.parse(response)))
      pokeapi_component = Communication::Components::PokeapiComponent.new(rest_client: @rest_client)

      expected_result = described_class.new(pokeapi_component: pokeapi_component).get_info("ditto")

      expect(expected_result).to eql(JSON.parse(response)["body"])
    end
  end
end
