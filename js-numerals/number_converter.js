// Global dictionary variable for primitive elements, these are needed to compose a text for any number
var number_names = {
  0 : "zero", 1 : "one", 2 : "two", 3 : "three", 4 : "four",
  5 : "five", 6 : "six", 7 : "seven", 8 : "eight", 9 : "nine",
  10 : "ten", 11 : "eleven", 12 : "twelve", 13 : "thirteen", 14 : "fourteen",
  15 : "fifteen", 16 : "sixteen", 17 : "seventeen", 18 : "eighteen", 19 : "nineteen",
  20 : "twenty", 30 : "thirty", 40 : "fourty", 50 : "fifty", 60 : "sixty",
  70 : "seventy", 80 : "eighty", 90 : "ninety", 100 : "hundred", 1000 : "thousand",
  1000000 : "million"
}

// Converts number to text format within the range 0 to 1000000000
function convert_number(number){
  // If the given number exists in the hash as key, then return its value
  if(number in number_names) {
    return number_names[number]
  }
  // In case of number below 100
  else if(number < 100) {
    ten_part = parseInt(number / 10) * 10
    return `${convert_number(ten_part)}-${convert_number(number - ten_part)}`
  }
  // In case of number between 100 and 2000
  else if(number > 100 && number < 2000) {
    hundred_part = parseInt(number / 100)
    return `${convert_number(hundred_part)} hundred and ${convert_number(number - (hundred_part * 100))}`
  }
  // In case of number between 2000 and 1000000
  else if(number >= 2000 && number < 1000000) {
    thousand_part = parseInt(number / 1000)
    // Decide if 'and' word needed after the thousand part of the text
    if((number - (thousand_part * 1000)) < 100) {
      return `${convert_number(thousand_part)} thousand and ${convert_number(number - (thousand_part * 1000))}`
    }
    else {
      return `${convert_number(thousand_part)} thousand ${convert_number(number - (thousand_part * 1000))}`
    }
  }
  // In case of number between 1000000 and 1000000000
  else if(number >= 1000000 && number < 1000000000) {
    million_part = parseInt(number / 1000000)
    // Decide if 'and' word needed after the million part of the text
    if((number - (million_part * 1000000)) < 100) {
      return `${convert_number(million_part)} million and ${convert_number(number - (million_part * 1000000))}`
    }
    else {
      return `${convert_number(million_part)} million ${convert_number(number - (million_part * 1000000))}`
    }
  }
}

// Event handler for the convert button click event
function btnConvertClicked() {
  // Get controls
  inputContainer = document.getElementById("input-number")
  resultContainer = document.getElementById("result-container")

  // Check if input value is valid (is a number and in the range)
  if(isNaN(inputContainer.value)) {
    alert("The given input is not a number. Please enter a valid number!")
  }
  else if(inputContainer.value > 1000000000) {
    alert("The given number is too big. Please enter a number less than 1.000.000.000!")
  }
  else if(inputContainer.value < 0) {
    alert("Negative numbers are not allowed. Please enter a number less than 1.000.000.000!")
  }
  else {
    resultContainer.innerText = convert_number(inputContainer.value)
  }
}
