class NumberConverter
  @@number_names = {
    0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
    5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
    10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
    15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen",
    20 => "twenty", 30 => "thirty", 40 => "fourty", 50 => "fifty", 60 => "sixty",
    70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "hundred", 1000 => "thousand",
    1000000 => "million"
  }

  def self.number_to_text nr
    if @@number_names.keys.include? nr
      @@number_names[nr]
    else
      if nr < 100
        ten_part = (nr / 10).to_i * 10
        "#{number_to_text(ten_part)}-#{number_to_text(nr - ten_part)}"
      elsif nr > 100 && nr < 2000
        hundred_part = (nr / 100).to_i
        "#{number_to_text(hundred_part)} hundred and #{number_to_text(nr - (hundred_part * 100))}"
      elsif nr >= 2000 && nr < 1000000
        thousand_part = (nr / 1000).to_i
        if nr - (thousand_part * 1000) < 100
          "#{number_to_text(thousand_part)} thousand and #{number_to_text(nr - (thousand_part * 1000))}"
        else
          "#{number_to_text(thousand_part)} thousand #{number_to_text(nr - (thousand_part * 1000))}"
        end
      elsif nr >= 1000000 && nr < 1000000000
        million_part = (nr / 1000000).to_i
        if nr - (million_part * 1000000) < 100
          "#{number_to_text(million_part)} million and #{number_to_text(nr - (million_part * 1000000))}"
        else
          "#{number_to_text(million_part)} million #{number_to_text(nr - (million_part * 1000000))}"
        end
      else
        "Too big number!"
      end
    end
  end
end
