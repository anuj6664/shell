#!/bin/bash

file="$1"

awk -F',' '
NR==2 {
    max_salary=$3
    employee=$1
}
NR>1 {
    if ($3 > max_salary) {
        max_salary=$3
        employee=$1
    }
}
END {
    print "Employee: " employee
    print "Salary: " max_salary
}
' "$file"