#!/bin/bash

# define filename variable
filename="/var/www/html/mychart/results.csv"

# check if file exists
if [ ! -f $filename ]; then
  echo "Error: File not found!"
  exit 1
fi

# check for invalid timestamp format
if ! grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2};[0-9]+$' $filename; then
  echo "Error: Invalid timestamp format!"
fi

# check for missing values
if grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2};$' $filename; then
  echo "Error: Missing value!"
fi

# check for non-numeric values
if grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2};[^0-9].*$' $filename; then
  echo "Error: Non-numeric value!"
fi
