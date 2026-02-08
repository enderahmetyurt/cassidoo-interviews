def find_konami_mapping(str)
  konami = "UUDDLRLRBA"

  each_konami_window(str) do |substring|
    mapping = build_mapping(substring, konami)
    return mapping if mapping
  end

  nil
end

private

def each_konami_window(str)
  konami_length = 10
  return if str.length < konami_length

  (0..str.length - konami_length).each do |i|
    yield str[i, konami_length]
  end
end

def build_mapping(substring, konami)
  char_to_move = {}
  move_to_char = {}

  substring.chars.each_with_index do |char, index|
    move = konami[index]

    return nil if conflicts_with_existing_mapping?(char, move, char_to_move, move_to_char)

    char_to_move[char] = move
    move_to_char[move] = char
  end

  char_to_move.sort.to_h
end

def conflicts_with_existing_mapping?(char, move, char_to_move, move_to_char)
  (char_to_move[char] && char_to_move[char] != move) ||
    (move_to_char[move] && move_to_char[move] != char)
end


puts find_konami_mapping("xx2233454590yy11110")
