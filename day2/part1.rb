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

qualifying_games = games.select{|game| game['red'] <= 12 && game['green'] <= 13 && game['blue'] <= 14}
sum = 0
qualifying_games.each{|game| sum += game['id']}
puts "the sum of qualifying game ids is #{sum}"
