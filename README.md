# Network-Analytic-Test

This repository contains scripts for testing network latency and shows if downloads are possible. It also includes instructions for setting up a cronjob to run these scripts and an Apache server.

## Introduction

These scripts can be useful for monitoring the performance of a network or diagnosing issues with network connectivity.

## Instructions

To use these scripts, follow these steps:

1. Install an Apache server on your machine.
2. Clone this repository to your machine.
3. Create a cronjob to run the `latency.sh` and `test-downloads.sh` scripts every minute.
4. Create a directory called `mychart` in your web directory.
5. Copy the three HTML files in the repository to your web directory.

### Setting up a cronjob

To create a cronjob for the `latency.sh` and `test-downloads.sh` scripts, follow these steps:

1. Open a terminal window.
2. Type `crontab -e` to open the crontab editor.

/path/to/latency.sh
/path/to/test-downloads.sh

4. Replace `/path/to` with the path to the directory where the scripts are located.
5. Save and close the crontab editor.

### Apache server

To install an Apache server on your machine, follow these steps:

1. Open a terminal window.
2. Type the following command to install Apache:

`sudo apt-get install apache2`


3. Follow the prompts to complete the installation.

### HTML files

The repository includes three HTML files:

- `alt.html`: displays the current latency of the network.
- `csv.html`: shows if downloads are possible of the network.
- `index.html`: a landing page that links to the other two HTML files.

To use these files, copy them to your web directory. The `mychart` directory should be empty and will be filled with data by the scripts.

## Nice to have

It has the possibility to rename all measured values by simply adding "alt-" in front of the csv file name -> "alt-results.csv" This allows you to view the old measured values on the second html page. This can be helpful when you change network settings and want to measure if there are any effects. 

## Conclusion

This repository provides a set of scripts and instructions for testing network latency and download speed. By setting up a cronjob to run these scripts and installing an Apache server, you can monitor the performance of your network and diagnose issues with network connectivity.

Fun fact: Chat GPT-3 has created about 90% of the code 
