# jrvs_bootcamp

## Introduction
CLuster monitor agent helps an infrastructure manager to keep track of the hardware specifications and resource usages such as CPU idle time, free memory, disk avaliability etc of a linux cluster. It also enables to store the above vital inforamation that the manager wants to keep track in form RDBMS database.On this database the manager can perform required analytics to gain insights and take suitable action.

## Architecture and Design
Description of host_info table
This table stores information regarding computer hardware such as CPU number, CPU architecture, CPU model, L2 cache, CPU mhz, timestamp of the host. 

Description of host_usage table
This tables collects and persists CPU and memory usage data of the host such as free memory, CPU idel time, CPU kernel, Disk IO and Disk avaliability. 

## Description of scripts
host_info.sh
This bash script performs four major steps as follows:
1.Parses and stores the variables which calculates/collects information of computer hardware.
2.Putting these variables or inserting them into the table
3.executing the insert statement
4.saving the host id 

host_usage.sh
This bash script performs three major steps as follows:
1.Parses and stores the varaibales which calculates/collects information of CPU and memory data usage
2.Putting these variables or inserting them into the table
3.executing the insert statement

## Usage
the above mentioned bash scripts are used to collect the required or desired information and formatted accordingly to put into a table format.A crontab job is created to schedule to run every minute of every hourof every day of every week on the bash script host_usag.sh. 

## Improvements
1. to keep track of the performance of the nodes using postgresql to extract required statistics and then create visualisatios which show the performances of each node
2. The similar process can be done for different nodes and their performance can be trackes
3. Will write a script to detect node failures and trigger when certain number of nodes fail
 
