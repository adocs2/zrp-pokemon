require 'rails_helper'

describe Communication::Components::PokeapiComponent do
  context 'when getting pokemon info' do
    it 'returns status 200' do
      @rest_client = double('rest_client')
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

      allow(@rest_client).to receive(:get).and_return(OpenStruct.new(JSON.parse(response)))

      expected_result = described_class.new(rest_client: @rest_client).get_info('ditto')

      expect(expected_result).to eql(JSON.parse(response)["body"])
    end
  end
end
