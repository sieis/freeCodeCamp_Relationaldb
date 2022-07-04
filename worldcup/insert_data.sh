#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# add each unique team to the teams table...should be 24 rows

echo $($PSQL "TRUNCATE teams,games")
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  # $($PSQL "TRUNCATE teams,games")
  if [[ $year != "year" ]]
    then
      echo $($PSQL "INSERT INTO teams(name) VALUES('$winner')");
      echo $($PSQL "INSERT INTO teams(name) VALUES('$opponent')");
  fi
    winnerID=$($PSQL "SELECT team_id FROM teams WHERE(name='$winner')")
    opponentID=$($PSQL "SELECT team_id FROM teams WHERE(name='$opponent')")
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals,opponent_goals) VALUES('$year','$round','$winnerID','$opponentID','$winner_goals','$opponent_goals')")
done