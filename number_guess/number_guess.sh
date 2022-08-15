#!/bin/bash

# Your script should randomly generate a number that users have to guess
# Resource for random:~~~ https://linuxhint.com/generate-random-number-bash/ ~~~
NUMBER=$(($RANDOM % 1000 +1))
# Set the psql variable
PSQL="psql --username=freecodecamp --dbname=random_numbers -t --no-align -c"
# set the guesses to one in case someone guesses it on the first try
GUESSES=1

GUESSING(){
  # prompt for username
  echo "Enter your username:"
  read USERNAME
  # username logic if player has played before or not
  if [[ -n $($PSQL "SELECT username FROM users WHERE (username = '$USERNAME')") ]]
    then
      GAMES_PLAYED=$($PSQL "SELECT COUNT(username) FROM games FULL JOIN users ON games.user_id=users.user_id WHERE username='$USERNAME'")
      BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games FULL JOIN users ON games.user_id=users.user_id WHERE username='$USERNAME'")
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
      DB_USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
      echo "Welcome back, $DB_USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    else
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  fi
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  # if not an int, prompt for number again
  while ! [[ $GUESS =~ [0-9] ]]
    do
      echo "That is not an integer, guess again: "
      read GUESS
    done
  # while loops in bash resource: ~~ https://www.cyberciti.biz/faq/bash-while-loop/ ~~
  while [ $GUESS -ne $NUMBER ]
  do
    # Increment GUESSES & keep guessing till you get the secret number
    GUESSES=$(($GUESSES+1))
    if [[ $GUESS -gt $NUMBER ]]
    then
      echo "It's lower than that, guess again: "
      read GUESS
    else
      echo "It's higher than that, guess again: "
      read GUESS
    fi
  done
  # Enter guesses into database & final message
  ENTRY=$($PSQL "INSERT INTO games(user_id,guesses) VALUES('$USER_ID','$GUESSES');")
  echo "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
}



GUESSING