def process_card(winning_numbers, drawn_numbers)
  matches = 0
  drawn_numbers.each{|n| matches += 1 if winning_numbers.include?(n)}
  if matches > 0
    worth = 2 ** (matches - 1)
  else
    worth = 0
  end
  return worth
end

sum = 0
STDIN.each_line do |line|
  winning_numbers = line.split('|').first.split(':').last.split(' ')
  drawn_numbers = line.split('|').last.split(' ')
  sum += process_card(winning_numbers, drawn_numbers)
end

puts "the cards in total are worth #{sum} points"
