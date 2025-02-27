#!/bin/bash

# Function to calculate square root
square_root() {
    echo -n "Enter a number: "
    read num
    result=$(echo "sqrt($num)" | bc -l)
    echo "Square root of $num is: $result"
}

# Function to calculate factorial
factorial() {
    echo -n "Enter a number: "
    read num
    fact=1
    for (( i=1; i<=num; i++ ))
    do
        fact=$((fact * i))
    done
    echo "Factorial of $num is: $fact"
}

# Function to calculate natural logarithm (ln x)
natural_log() {
    echo -n "Enter a number: "
    read num
    result=$(echo "l($num)" | bc -l)
    echo "Natural logarithm (ln $num) is: $result"
}

# Function to calculate power (x^b)
power() {
    echo -n "Enter base number: "
    read base
    echo -n "Enter exponent: "
    read exponent
    result=$(echo "$base^$exponent" | bc -l)
    echo "$base raised to the power $exponent is: $result"
}

# Display menu
while true; do
    echo "Scientific Calculator - Choose an operation:"
    echo "1. Square Root"
    echo "2. Factorial"
    echo "3. Natural Logarithm"
    echo "4. Power"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) square_root ;;
        2) factorial ;;
        3) natural_log ;;
        4) power ;;
        5) echo "Exiting..."; exit ;;
        *) echo "Invalid choice, try again!" ;;
    esac
done
