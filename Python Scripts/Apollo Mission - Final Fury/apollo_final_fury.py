import curses
import time
import random
import os
import sys

try:
    import pygame
    pygame.mixer.init()
    SOUND_ENABLED = True
except:
    SOUND_ENABLED = False

def play_sound():
    if SOUND_ENABLED:
        try:
            sound = pygame.mixer.Sound('beep.wav')
            sound.play()
        except:
            print("[!] Beep sound missing, using terminal bell.")
            print('\a', end='', flush=True)
    else:
        print('\a', end='', flush=True)

def title_screen(stdscr):
    curses.start_color()
    curses.use_default_colors()
    stdscr.clear()
    h, w = stdscr.getmaxyx()
    title = "APOLLO MISSION: FINAL FURY"
    stdscr.addstr(h // 2 - 2, w // 2 - len(title) // 2, title, curses.A_BOLD)
    stdscr.addstr(h // 2, w // 2 - 15, "L = Launch | S = Self-Destruct | A = Abort | E = Easter Egg")
    stdscr.refresh()
    time.sleep(3)

def launch(stdscr):
    rocket = [
    "        ^",
    "       / \\",
    "      /___\\",
    "      |###|",
    "      |###|",
    "      |###|",
    "     /#####\\",
    "    /#######\\",
    "   /#########\\",
    "   |#########|",
    "   |#########|",
    "    \\#######/",
    "     \\#####/",
    "      |###|",
    "      |###|",
    "       ==="
]       
    sh, sw = stdscr.getmaxyx()
    rx = sw // 2 - len(rocket[0]) // 2
    ry = sh - len(rocket) - 1
    countdown(stdscr)
    while True:
        stdscr.clear()
        for i, line in enumerate(rocket):
            if 0 <= ry + i < sh:
                stdscr.addstr(ry + i, rx, line)
        for _ in range(5):
            fx = rx + random.randint(-2, len(rocket[0]) + 2)
            fy = ry + len(rocket) + random.randint(0, 2)
            if 0 < fy < sh and 0 < fx < sw:
                stdscr.addstr(fy, fx, random.choice(['^', '*', '#']), curses.color_pair(1))
                play_sound()
        stdscr.refresh()
        time.sleep(0.1)
        ry -= 1
        if ry < -len(rocket):
            victory_screen(stdscr)
            break

def countdown(stdscr):
    sh, sw = stdscr.getmaxyx()
    for i in range(5, 0, -1):
        stdscr.clear()
        stdscr.addstr(sh // 2, sw // 2 - 10, f"T-minus {i} seconds...")
        stdscr.refresh()
        play_sound()
        time.sleep(1)
    stdscr.addstr(sh // 2, sw // 2 - 10, "Ignition!")
    stdscr.refresh()
    time.sleep(1)

def self_destruct(stdscr):
    sh, sw = stdscr.getmaxyx()
    stdscr.clear()
    stdscr.addstr(sh // 2, sw // 2 - 10, "⚠️  Self-Destruct Initiated ⚠️")
    stdscr.refresh()
    for i in range(5, 0, -1):
        stdscr.addstr(sh // 2 + 2, sw // 2 - 5, f"Exploding in {i}...")
        stdscr.refresh()
        play_sound()
        time.sleep(1)
    for _ in range(50):
        stdscr.addstr(random.randint(0, sh - 1), random.randint(0, sw - 1), random.choice(['*', '#', '@', '+']), curses.color_pair(1))
        stdscr.refresh()
        time.sleep(0.03)
    stdscr.addstr(sh // 2, sw // 2 - 8, "💥 BOOM! Rocket Destroyed! 💥")
    stdscr.refresh()
    time.sleep(3)

def victory_screen(stdscr):
    stdscr.clear()
    h, w = stdscr.getmaxyx()
    msg = "🚀 Mission Accomplished! Apollo Final Fury has launched! 🚀"
    stdscr.addstr(h // 2, w // 2 - len(msg) // 2, msg, curses.A_BOLD)
    stdscr.refresh()
    time.sleep(4)

def easter_egg(stdscr):
    stdscr.clear()
    h, w = stdscr.getmaxyx()
    stdscr.addstr(h // 2, w // 2 - 10, "🐱 The Alien Cat is Watching... 🐱")
    stdscr.refresh()
    time.sleep(3)

def main(stdscr):
    title_screen(stdscr)
    while True:
        stdscr.nodelay(True)
        key = stdscr.getch()
        if key == ord('l'):
            launch(stdscr)
        elif key == ord('s'):
            self_destruct(stdscr)
        elif key == ord('a'):
            stdscr.addstr(5, 10, "Mission Aborted. Returning to base.")
            stdscr.refresh()
            time.sleep(2)
            break
        elif key == ord('e'):
            easter_egg(stdscr)

curses.wrapper(main)
