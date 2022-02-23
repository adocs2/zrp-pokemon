require 'rails_helper'

describe Pokemon::Adapters::In::PokemonAdapter do
  context 'when adapting pokemon name' do
    it 'return a downcased pokemon name' do
      params = { pokemon_name: 'ChaRmAnder' }

      expected_result = described_class.adapt_pokemon_name(params)

      expect(expected_result).to eql('charmander')
    end
  end
end
