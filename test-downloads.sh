#!/bin/bash

# Pfad zum Ergebnis-Datei
RESULTS_FILE="/var/www/html/mychart/results.csv"

# Prüfen, ob die Datei vorhanden ist. Falls nicht, erstellen.
if [ ! -f "$RESULTS_FILE" ]; then
    echo "Erstelle Datei $RESULTS_FILE"
    echo "Zeitstempel,Erfolgreich" > "$RESULTS_FILE"
fi

# Herunterladen der Datei und Verarbeitung des Ergebnisses
echo "Lade Datei herunter..."
if wget http://ipv4.download.thinkbroadband.com/20MB.zip; then
    echo "Download erfolgreich."
    # Erfolgreicher Download, Zeitstempel und Wert 1 in CSV-Datei schreiben
    current_time=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$current_time;1" >> "$RESULTS_FILE"
else
    echo "Download fehlgeschlagen."
    # Fehlgeschlagener Download, Zeitstempel und Wert 0 in CSV-Datei schreiben
    current_time=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$current_time;0" >> "$RESULTS_FILE"
fi

# Löschen der heruntergeladenen Datei
rm 20MB.zip

# Pfad zum Ziel-Verzeichnis
TARGET_DIR="/var/www/html/mychart"

# Ergebnis-Datei in das Ziel-Verzeichnis kopieren
cp "$RESULTS_FILE" "$TARGET_DIR"

echo "Daten generiert und transferiert"
