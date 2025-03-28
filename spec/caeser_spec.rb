require_relative '../lib/caeser.rb'

describe 'Caeser cipher methods' do
  describe '#caeser_cipher' do
    let(:message){ "Hello, World!" }
    let(:shift){ 4 }

    before do
      allow(self).to receive(:create_cipher)
      allow(self).to receive(:single_translate).and_return('a')
    end

    it 'calls create_cipher method' do
      expect(self).to receive(:create_cipher).with(shift).once
      caeser_cipher(message, shift)
    end

    it 'calls single_translate method' do
      expect(self).to receive(:single_translate).exactly(message.length).times
      caeser_cipher(message, shift)
    end
  end

  describe '#single_translate' do
    let(:key){ {'a': 'x', 'b': 'y', 'c': 'z'} }

    it 'translates lowercase letter' do
      letter = 'a'
      translated_letter = single_translate(letter, key)
      expect(translated_letter).to eq('x')
    end

    it 'translates uppercase letter' do
      letter = 'B'
      translated_letter = single_translate(letter, key)
      expect(translated_letter).to eq('Y')
    end

    it 'translates symbols' do
      symbol = '!'
      translated_symbol = single_translate(symbol, key)
      expect(translated_symbol).to eq('!')
    end
  end

  describe '#create_cipher' do
    let(:alphabet){ 'a'.upto('z').to_a }
    let(:alpha_h){ 'h'.upto('z').to_a.concat('a'.upto('g').to_a) }
    let(:alpha_y){ ['y', 'z'].concat('a'.upto('x').to_a) }

    it 'create cipher with positive shift' do
      shift = 7
      cipher_key = create_cipher(shift)
      expect(cipher_key.values).to eq(alpha_h)
    end

    it 'create cipher with negative shift' do
      shift = -2
      cipher_key = create_cipher(shift)
      expect(cipher_key.values).to eq(alpha_y)
    end

    it 'create cipher with very large positive shift' do
      shift = 52
      cipher_key = create_cipher(shift)
      expect(cipher_key.values).to eq(alphabet)
    end

  end
end
