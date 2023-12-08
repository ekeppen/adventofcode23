sum = 0
def translate_number(number)
  case number
  when "nine"
    translated = "9"
  when "eight"
    translated = "8"
  when "seven"
    translated = "7"
  when "six"
    translated = "6"
  when "five"
    translated = "5"
  when "four"
    translated = "4"
  when "three"
    translated = "3"
  when "two"
    translated = "2"
  when "one"
    translated = "1"
  else
    translated = number
  end
  return translated
end

STDIN.each do |line|
  line.gsub!(/(?<letter>t|o(?!u)|e(?![vn])|n(?!e))/,'\k<letter>'*2)
  integers = line.scan(/one|two|three|four|five|six|seven|eight|nine|\d/)
  calibration_values = [integers[0], integers[-1]]
  calibration_values.map!{|i| translate_number(i)}
  sum += (calibration_values.join).to_i
end
puts "The sum of the values is:"
puts sum
