#!/bin/bash

# Bash Quiz Game (Final Clean Version)

clear

function loading_screen {
  echo -e "\nLoading the Bash Quiz Game..."
  for i in {5..1}; do
    echo "Starting in... $i"
    sleep 1
  done
  echo "Let's go!"
  sleep 1
}

function ask_question {
  question="$1"
  correct="$2"
  echo -n "$question "
  read ans
  ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]')
  correct=$(echo "$correct" | tr '[:upper:]' '[:lower:]')
  if [[ "$ans" == "$correct" ]]; then
    ((score++))
    echo "✅ Correct!"
  else
    echo "❌ Wrong! The correct answer was: $correct"
  fi
}

function weather_quiz {
  score=0
  echo -e "\n🌦️ Weather Quiz"
  ask_question "Main gas in Earth's atmosphere?" "Nitrogen"
  ask_question "Cloud type for thunderstorms?" "Cumulonimbus"
  ask_question "Scale for hurricanes?" "Saffir-Simpson"
  ask_question "Air pressure tool?" "Barometer"
  ask_question "Boundary between air masses?" "Front"
  ask_question "Layer with weather?" "Troposphere"
  ask_question "West-to-east winds called?" "Westerlies"
  ask_question "Humidity is measured by?" "Hygrometer"
  ask_question "Frozen precipitation?" "Snow"
  ask_question "Eye of a hurricane?" "The calm center"
}

function geography_quiz {
  score=0
  echo -e "\n🌍 Geography Quiz"
  ask_question "Capital of Japan?" "Tokyo"
  ask_question "Largest desert?" "Antarctica"
  ask_question "Longest river?" "Nile"
  ask_question "Deepest ocean?" "Pacific"
  ask_question "Country with most islands?" "Sweden"
  ask_question "Highest mountain?" "Everest"
  ask_question "Sahara Desert is in?" "Africa"
  ask_question "Smallest country?" "Vatican City"
  ask_question "Largest country by land?" "Russia"
  ask_question "Capital of Australia?" "Canberra"
}

function math_quiz {
  score=0
  echo -e "\n➗ Math Quiz"
  ask_question "7 * 8?" "56"
  ask_question "Square root of 144?" "12"
  ask_question "Pi to 2 decimals?" "3.14"
  ask_question "15 + 27?" "42"
  ask_question "100 / 4?" "25"
  ask_question "2^5?" "32"
  ask_question "9 squared?" "81"
  ask_question "Factorial of 4?" "24"
  ask_question "Derivative of x^2?" "2x"
  ask_question "Simplify: 5x + 2x?" "7x"
}

function secret_quiz {
  score=0
  echo -e "\n👽 Secret Quiz"
  ask_question "Year of first iPhone?" "2007"
  ask_question "Spell Pneumonoultramicroscopicsilicovolcanoconiosis?" "Pneumonoultramicroscopicsilicovolcanoconiosis"
  ask_question "Python inventor?" "Guido van Rossum"
  ask_question "Closest planet to sun?" "Mercury"
  ask_question "42 in binary?" "101010"
  ask_question "Gold symbol?" "Au"
  ask_question "'I'll be back' movie?" "The Terminator"
  ask_question "Moon landing year?" "1969"
  ask_question "Speed of light km/s?" "300000"
  ask_question "13 * 13?" "169"

  echo -e "\n👽   /\\_/\\  "
  echo "👽  ( o.o )"
  echo "👽   > ^ <"
  echo "The alien cat says hello!"
}

function main_menu {
  while true; do
    loading_screen
    echo -e "\n🌟 Bash Quiz Game 🌟"
    echo "1) Weather"
    echo "2) Geography"
    echo "3) Math"
    echo "Type 'secret' for something special."
    echo "Type 'exit' to quit."
    echo -n "Your choice: "
    read choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

    if [[ "$choice" == "exit" ]]; then
      echo "Thanks for playing! Goodbye!"
      exit 0
    elif [[ "$choice" == "secret" ]]; then
      secret_quiz
    elif [[ "$choice" == "1" ]]; then
      weather_quiz
    elif [[ "$choice" == "2" ]]; then
      geography_quiz
    elif [[ "$choice" == "3" ]]; then
      math_quiz
    else
      echo "Invalid choice. Try again!"
      continue
    fi

    echo -e "\n🎉 Final score: $score / 10"
    if ((score >= 8)); then
      echo "🔥 You're a quiz master!"
    elif ((score >= 5)); then
      echo "Not bad, keep going!"
    else
      echo "Better luck next time!"
    fi

    echo ""
    read -p "Press Enter to return to the menu..."
    clear
  done
}

main_menu
