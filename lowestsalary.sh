#!/bin/bash

file="$1"

awk -F',' '
NR==2 {
    min_salary=$3
    employee=$1
}
NR>1 {
    if ($3 < min_salary) {
        min_salary=$3
        employee=$1
    }
}
END {
    print "Employee: " employee
    print "Salary: " min_salary
}
' "$file"

