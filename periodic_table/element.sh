#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
    # If you run ./element.sh, it should output Please provide an element as an argument. and finish running.
    then
        echo "Please provide an element as an argument."
    else
        # If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
        # If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.
        ELEMENT=$1
        SYMBOLS=$($PSQL "SELECT symbol FROM elements")
        NUMBERS=$($PSQL "SELECT atomic_number FROM elements")
        NAMES=$($PSQL "SELECT name FROM elements")
        if [[ $NUMBERS =~ $ELEMENT ]]
        then
            ATOMIC_NUMBER=$($PSQL"SELECT atomic_number FROM elements WHERE atomic_number=$ELEMENT")
            # get rid of leading space on symbol
            # FOO_NO_LEAD_SPACE="$(echo -e "${FOO}" | sed -e 's/^[[:space:]]*//')"
            # from https://gist.github.com/OlegGorj/14bfbbdb5e628d48824d971e0ea5bca3
            SYMBOL="$(echo -e "$($PSQL"SELECT symbol FROM elements WHERE atomic_number=$ELEMENT")" | sed -e 's/^[[:space:]]*//')"
            NAME=$($PSQL"SELECT name FROM elements WHERE atomic_number=$ELEMENT")
            ATOMIC_MASS=$($PSQL"SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT")
            MELTING_POINT=$($PSQL"SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT")
            BOILING_POINT=$($PSQL"SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT")
            TYPE=$($PSQL"SELECT type FROM types INNER JOIN properties ON types.type_id=properties.type_id WHERE atomic_number=$ELEMENT")
            echo -e "The element with atomic number"${ATOMIC_NUMBER} "is$NAME ("${SYMBOL}"). It's a"${TYPE}", with a mass of"${ATOMIC_MASS}" amu.$NAME has a melting point of"${MELTING_POINT} "celsius and a boiling point of"${BOILING_POINT} "celsius."

        elif [[ $SYMBOLS =~ $ELEMENT ]]
        then
            ATOMIC_NUMBER=$($PSQL"SELECT atomic_number FROM elements WHERE symbol='$ELEMENT'")
            # get rid of leading space on symbol
            # FOO_NO_LEAD_SPACE="$(echo -e "${FOO}" | sed -e 's/^[[:space:]]*//')"
            # from https://gist.github.com/OlegGorj/14bfbbdb5e628d48824d971e0ea5bca3
            SYMBOL="$(echo -e "$($PSQL"SELECT symbol FROM elements WHERE symbol='$ELEMENT'")" | sed -e 's/^[[:space:]]*//')"
            # SYMBOL=$($PSQL"SELECT symbol FROM elements WHERE symbol='$ELEMENT'")
            NAME=$($PSQL"SELECT name FROM elements WHERE symbol='$ELEMENT'")
            ATOMIC_MASS=$($PSQL"SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            MELTING_POINT=$($PSQL"SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            BOILING_POINT=$($PSQL"SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE=$($PSQL"SELECT type FROM types INNER JOIN properties ON types.type_id=properties.type_id WHERE atomic_number=$ATOMIC_NUMBER")
            echo -e "The element with atomic number"${ATOMIC_NUMBER} "is$NAME ("${SYMBOL}"). It's a"${TYPE}", with a mass of"${ATOMIC_MASS}" amu.$NAME has a melting point of"${MELTING_POINT} "celsius and a boiling point of"${BOILING_POINT} "celsius."
        elif [[ $NAMES =~ $ELEMENT ]]
        then
            ATOMIC_NUMBER=$($PSQL"SELECT atomic_number FROM elements WHERE name='$ELEMENT'")
            # get rid of leading space on symbol
            # FOO_NO_LEAD_SPACE="$(echo -e "${FOO}" | sed -e 's/^[[:space:]]*//')"
            # from https://gist.github.com/OlegGorj/14bfbbdb5e628d48824d971e0ea5bca3
            SYMBOL="$(echo -e "$($PSQL"SELECT symbol FROM elements WHERE name='$ELEMENT'")" | sed -e 's/^[[:space:]]*//')"
            # SYMBOL=$($PSQL"SELECT symbol FROM elements WHERE name='$ELEMENT'")
            NAME=$($PSQL"SELECT name FROM elements WHERE name='$ELEMENT'")
            ATOMIC_MASS=$($PSQL"SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            MELTING_POINT=$($PSQL"SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            BOILING_POINT=$($PSQL"SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE=$($PSQL"SELECT type FROM types INNER JOIN properties ON types.type_id=properties.type_id WHERE atomic_number=$ATOMIC_NUMBER")
            echo -e "The element with atomic number"${ATOMIC_NUMBER} "is$NAME ("${SYMBOL}"). It's a"${TYPE}", with a mass of"${ATOMIC_MASS}" amu.$NAME has a melting point of"${MELTING_POINT} "celsius and a boiling point of"${BOILING_POINT} "celsius."
        else
            echo "I could not find that element in the database."
        fi
fi