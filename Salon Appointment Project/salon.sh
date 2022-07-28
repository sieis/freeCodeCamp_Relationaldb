#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU(){
    if [[ $1 ]]
    then
        echo -e "$1\n"
    fi
    # loop through services and print options
    AVAILABLE_SERVICES=$($PSQL "SELECT service_id,name FROM services")
    # prompt to select service
    echo -e "\n~~~~ Here are our services ~~~~\n"
    echo -e "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME BAR
    do
        echo "$SERVICE_ID) $NAME"
    done
    # prompt for service_id
    echo "Pick a service"
    read SERVICE_ID_SELECTED
    # if it doesn't exist
    if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]$ ]]
    # show main list again
    then
        MAIN_MENU "That doesn't exist."
    else
        SERVICE_NAME_SELECTED=$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED'")
        # otherwise prompt for phone,
        echo "What's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        # if not a customer
        if [[ -z $CUSTOMER_NAME ]]
        # prompt for name
        then
            echo "What's your name?"
            read CUSTOMER_NAME
            # insert customer info
            INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
        fi
        # prompt for an appointment time
        echo "What time would you like an appointment for?"
        read SERVICE_TIME
        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        # insert appointment info
        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,service_id,customer_id) VALUES('$SERVICE_TIME','$SERVICE_ID_SELECTED','$CUSTOMER_ID')")
        # Display success message
        echo "I have put you down for a$SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
}
MAIN_MENU