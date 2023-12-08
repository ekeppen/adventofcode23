sum = 0
STDIN.each do |line|
  integers = line.scan(/\d/)
  calibration_values = integers[0] + integers[-1]
  sum += calibration_values.to_i
end
puts "The sum of the values is:"
puts sum
