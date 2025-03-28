def caeser_cipher(message, shift_factor)
  cipher_key = create_cipher(shift_factor)
  message.chars.map { |letter| single_translate(letter, cipher_key) }
    .join
end

def single_translate(letter, cipher_key) 
  if letter.match?(/[^a-zA-Z]/)
    letter
  elsif letter.upcase == letter
    cipher_key[letter.downcase.to_sym].upcase
  else
    cipher_key[letter.to_sym]
  end
end

def create_cipher(shift_factor)
  shift_factor %= 26
  alphabet = 'a'.upto('z').to_a
  shifted_alphabet = if shift_factor.zero?
                       alphabet
                     else
                       alphabet[shift_factor].upto('z').to_a
                         .concat('a'.upto(alphabet[shift_factor - 1]).to_a)
                     end
  alphabet.map.with_index { |letter, i| [letter, shifted_alphabet[i]] }.to_h
end
