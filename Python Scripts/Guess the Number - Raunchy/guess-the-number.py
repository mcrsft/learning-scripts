import random
import time

def witty_insult():
    insults = [
        "What the hell was that? My grandma could guess better!",
        "Are you even trying, or just smashing keys?",
        "That guess was as useful as a screen door on a submarine.",
        "I've seen smarter guesses from a drunk chicken.",
        "You absolute ding-dong, try again.",
        "Did you leave your brain at home today?",
        "That was the worst guess since sliced bread.",
        "You must be related to a potato. A dumb one.",
        "That guess was as bright as a blackout.",
        "Damn, even a rock would guess better!"
    ]
    return random.choice(insults)

def guess_the_number():
    print("\nWelcome to 'Guess the Damn Number: The Inappropriate Edition'")
    print("Brace yourself, buttercup. This ain't your grandma's number game.\n")
    time.sleep(1)

    score = 0
    level = 1

    while level <= 10:
        print(f"\nLevel {level} — Let's see if you're less useless this time.")
        max_number = level * 10
        number_to_guess = random.randint(1, max_number)
        attempts = 0
        points_per_level = 100 * level

        while True:
            try:
                guess = int(input(f"Guess the number (1-{max_number}): "))
                attempts += 1

                if guess < number_to_guess:
                    print(f"Too damn low. {witty_insult()}")
                elif guess > number_to_guess:
                    print(f"Too damn high. {witty_insult()}")
                else:
                    bonus = max(points_per_level - (attempts * 10), 10)
                    print(f"About time! You got it in {attempts} tries. You earn {bonus} points, you magnificent rascal.")
                    score += bonus
                    break
            except ValueError:
                print("Seriously? That's not even a number. Try again, genius.")

        level += 1
        time.sleep(1)

    print("\nGame over! Here's your final score, hotshot:")
    print(f"Final Score: {score} points")
    if score >= 800:
        print("Damn, you're on fire! You deserve a cold drink.")
    elif score >= 500:
        print("Not bad, kid. You might not be a complete idiot.")
    else:
        print("Yikes. Maybe stick to something simpler, like tic-tac-toe.")

    print("\nThanks for playing 'Guess the Damn Number: The Inappropriate Edition'!")

if __name__ == "__main__":
    guess_the_number()
