def process_card(winning_numbers, drawn_numbers)
  matches = 0
  drawn_numbers.each{|n| matches += 1 if winning_numbers.include?(n)}
  return matches
end

cards = {1 => 1}
current_card = 1
STDIN.each_line do |line|
  cards[current_card] = 1 unless cards[current_card]
  winning_numbers = line.split('|').first.split(':').last.split(' ')
  drawn_numbers = line.split('|').last.split(' ')
  matches = process_card(winning_numbers, drawn_numbers)
  won_cards = (current_card + 1..current_card + matches).to_a
  won_cards.each do |copy|
    cards[copy] = 1 unless cards[copy]
    cards[copy] += cards[current_card]
  end
  current_card += 1
end
sum = cards.values.sum
