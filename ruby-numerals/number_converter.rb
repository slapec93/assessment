class NumberConverter
  # Hash of primitive elements, these are needed to compose a text for any number
  @@number_names = {
    0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
    5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
    10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
    15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen",
    20 => "twenty", 30 => "thirty", 40 => "fourty", 50 => "fifty", 60 => "sixty",
    70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "hundred", 1000 => "thousand",
    1000000 => "million"
  }

  # Retrieves a given number in text form, the input number has to be below one billion
  def self.number_to_text nr
    # If the given number exists in the hash as key, then return its value
    if @@number_names.keys.include? nr
      @@number_names[nr]
    else
      # In case of number below 100
      if nr < 100
        ten_part = (nr / 10).to_i * 10
        "#{number_to_text(ten_part)}-#{number_to_text(nr - ten_part)}" # recursive call for the two part of the number
      # In case of number between 100 and 2000
      elsif nr > 100 && nr < 2000
        hundred_part = (nr / 100).to_i
        "#{number_to_text(hundred_part)} hundred and #{number_to_text(nr - (hundred_part * 100))}"
      # In case of number between 2000 and 1000000
      elsif nr >= 2000 && nr < 1000000
        thousand_part = (nr / 1000).to_i
        # Decide if 'and' word needed after the thousand part of the text
        if nr - (thousand_part * 1000) < 100
          "#{number_to_text(thousand_part)} thousand and #{number_to_text(nr - (thousand_part * 1000))}"
        else
          "#{number_to_text(thousand_part)} thousand #{number_to_text(nr - (thousand_part * 1000))}"
        end
      # In case of number between 1000000 and 1000000000
      elsif nr >= 1000000 && nr < 1000000000
        million_part = (nr / 1000000).to_i
        # Decide if 'and' word needed after the million part of the text
        if nr - (million_part * 1000000) < 100
          "#{number_to_text(million_part)} million and #{number_to_text(nr - (million_part * 1000000))}"
        else
          "#{number_to_text(million_part)} million #{number_to_text(nr - (million_part * 1000000))}"
        end
      elsif nr < 0
        "Negative numbers are not allowed!"
      # If the number is too big, then return with an error message
      else
        "Too big number!"
      end
    end
  end
end
