#!/bin/bash

# Name der CSV-Datei
filename="/var/www/html/mychart/latenz.csv"

# Überprüfen, ob die CSV-Datei vorhanden ist oder nicht
if [ ! -e "$filename" ]
then
  # CSV-Datei erstellen, wenn sie noch nicht vorhanden ist
  echo "" > "$filename"
fi

# Latenzmessung durchführen
ping_result=$(ping -c 1 google.com | grep 'time=' | awk -F '=' '{print $4}' | awk '{print $1}')

# Aktuelles Datum und Uhrzeit im angegebenen Format abrufen
timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

# Latenzzeit und Zeitstempel in die CSV-Datei schreiben
echo "$timestamp,$ping_result" >> "$filename"
