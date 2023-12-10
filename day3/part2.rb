input = STDIN.readlines
sum = 0
def check_left(line, position)
  offset = 1
  number_string = ""
  while line[position - offset].match?(/\d/)
    number_string.prepend(line[position - offset])
    offset += 1
  end
  return number_string
end

def check_right(line, position)
  offset = 1
  number_string = ""
  while line[position + offset].match?(/\d/)
    number_string += line[position + offset]
    offset += 1
  end
  return number_string 
end

def check_around(line, position)
  numbers = []
  if line[position].match?(/\d/)
    number_string = check_left(line, position) + line[position] + check_right(line,position)
    numbers = [number_string]
  else
    numbers << check_left(line, position)
    numbers << check_right(line, position)
  end
  return numbers
end

input.each_with_index do |line, line_index|
  next unless line.match?('\*')
  previous_line = input[line_index - 1] if line_index > 0
  next_line = input[line_index + 1] if line_index < input.length - 1
  gear_points = line.count('*')
  position = 0
  while gear_points > 0
    numbers = []
    position = line.index('*', position)
    numbers << check_left(line, position)
    numbers << check_right(line, position)
    numbers += check_around(previous_line, position) if previous_line
    numbers += check_around(next_line, position) if next_line
    numbers.map!(&:to_i)
    numbers -= [0]
    sum += numbers[0].to_i * numbers[1].to_i if numbers.length == 2
    position += 1
    gear_points -= 1
  end
end
puts "the sum of the gear score is: #{sum}"
