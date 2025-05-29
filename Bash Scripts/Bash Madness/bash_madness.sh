#!/bin/bash

# Bash Madness: Git Bash Friendly Version

# Title Screen
title_screen() {
  clear
  echo "======================================"
  echo "    🧨  Bash Madness Showcase  🧨"
  echo "  ASCII, Morse, Beeps, Cube & Hackers"
  echo "======================================"
  echo ""
  echo "Get ready for a wild ride in 5 seconds..."
  sleep 5
}

# 1️⃣ ASCII Animation
ascii_animation() {
  clear
  echo "🚀 Countdown starting!"
  for i in 5 4 3 2 1; do
    echo "🚀 Countdown: $i"
    sleep 1
  done
  echo "🚀 Liftoff!"
}

# 2️⃣ Morse Code
morse_code() {
  echo ""
  echo "Morse Code: SOS"
  echo -ne "..."
  echo -ne "\\a"
  sleep 0.2
  echo -ne "---"
  echo -ne "\\a"
  sleep 0.5
  echo -ne "..."
  echo -ne "\\a"
  echo ""
}

# 3️⃣ Beep Music
play_music() {
  echo ""
  echo "Playing Twinkle Twinkle (simulated)"
  for n in 1 2 3 4 5; do
    echo -ne "\\a"
    sleep 0.3
  done
}

# 4️⃣ ASCII Cube
ascii_cube() {
  echo ""
  echo "Spinning ASCII Cube..."
  for i in 1 2 3 4 5; do
    clear
    echo "   +--------+"
    echo "  /        /|"
    echo " +--------+ |"
    echo " |        | +"
    echo " |        |/"
    echo " +--------+"
    sleep 0.3
  done
}

# 5️⃣ Hacker Simulator
hacker_sim() {
  echo ""
  echo "Launching Fake Hacker Terminal..."
  for i in 1 2 3 4 5; do
    IP1=$(( ( RANDOM % 255 ) + 1 ))
    IP2=$(( ( RANDOM % 255 ) + 1 ))
    IP3=$(( ( RANDOM % 255 ) + 1 ))
    IP4=$(( ( RANDOM % 255 ) + 1 ))
    echo "[ $(date '+%H:%M:%S') ] Connecting to $IP1.$IP2.$IP3.$IP4..."
    sleep 0.3
  done
  echo "Access granted! (just kidding...)"
}

# 🚀 Run the showcase
title_screen
ascii_animation
sleep 5
morse_code
sleep 5
play_music
sleep 5
ascii_cube
sleep 5
hacker_sim

echo ""
echo "🎉 Bash Madness Complete! 🎉"
