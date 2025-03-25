def caeser_cipher(message, shift_factor)
  cipher_key = create_cipher(shift_factor)
  message.split('').map do |letter|
    if letter.match?(/[^a-zA-Z]/)
      letter
    elsif letter.upcase == letter
      cipher_key[letter.downcase].upcase
    else
      cipher_key[letter]
    end
  end
    .join('')
end

def create_cipher(shift_factor)
  shift_factor %= 25
  alphabet = 'a'.upto('z').to_a
  shifted_alphabet = if shift_factor.zero?
                       alphabet
                     else
                       alphabet[shift_factor].upto('z').to_a
                                             .concat('a'.upto(alphabet[shift_factor - 1]).to_a)
                     end
  alphabet.map.with_index { |letter, i| [letter, shifted_alphabet[i]] }.to_h
end
