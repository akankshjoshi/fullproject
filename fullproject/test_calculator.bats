#!/usr/bin/env bats

@test "Square root of 9 should be 3" {
    result=$(echo "sqrt(9)" | bc -l)
    [ "$result" = "3.00000000000000000000" ]
}

@test "Factorial of 5 should be 120" {
    fact=1
    for (( i=1; i<=5; i++ )); do
        fact=$((fact * i))
    done
    [ "$fact" -eq 120 ]
}

@test "Natural log of 1 should be 0" {
    result=$(echo "l(1)" | bc -l)
    [ "$result" = "0" ]
}

@test "2 raised to the power 3 should be 8" {
    result=$(echo "2^3" | bc -l)
    [ "$result" = "8" ]
}
