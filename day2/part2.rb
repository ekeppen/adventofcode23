games = []
n = 1
STDIN.each do |line|
  game_info = {'id'=>n,'red'=>0,'blue'=>0,'green'=>0}
  sets = line.split(":").last.split(";")
  sets.each do |set|
    results = set.split(",")
    results.each do |pull|
      quantity, color = pull.split(" ")
      game_info[color] = quantity.to_i if quantity.to_i > game_info[color]
    end
  end
  games << game_info
  n += 1
end

sum = 0
games.each do |game|
  power = game['red'].to_i * game['blue'].to_i * game['green'].to_i
  sum += power
end

puts "the power of all games is #{sum}"
