input = STDIN.readlines
sum = 0
input.each_with_index do |line, line_index|
  numbers = line.scan(/\d{1,3}/)
  previous_line = input[line_index - 1] if line_index > 0
  next_line = input[line_index + 1] if line_index < input.length - 1
  numbers.each do |number|
    surroundings = ""
    position = line.index(/\b#{number}\b/)
    #checkkkkkk to the left
    surroundings += line[position - 1] if position > 0
    #checkkkkkk to the right
    surroundings += line[position + number.length] if line[position + number.length]
    #charlie brown
    if position > 0
      surroundings += previous_line[position - 1, number.length + 2] if previous_line
      surroundings += next_line[position - 1, number.length + 2] if next_line
    else
      surroundings += previous_line[position, number.length + 1] if previous_line
      surroundings += next_line[position, number.length + 1] if next_line
    end
    #cha cha real smooth
    sum += number.to_i if surroundings.match?(/[!#@$%^&*?\-+=\/]/)
  end
end
puts "the sum of parts numbers is: #{sum}"
