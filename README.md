# jrvs_bootcamp

## Introduction
CLuster monitor agent helps an infrastructure manager to keep track of the hardware specifications and resource usages such as CPU idle time, free memory, disk avaliability etc of a linux cluster. It also enables to store the above vital inforamation that the manager wants to keep track in form RDBMS database.On this database the manager can perform required analytics to gain insights and take suitable action.

## Architecture and Design
Design
Please click on the link to view the architecture 
https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=cluster-diagram.drawio#R3ZhNc5swEIZ%2FDcd2LIQNHP2RxO2k07Q%2BJDnKsAG12GKEHEN%2FfcUgvixcnAz2OD1Z%2B3olwbPvSGsbeL5J7ziJw2%2FMh8gwR35q4IVhmgi7lvzIlaxQ7JFbCAGnvkqqhRX9A0ocKXVHfUhaiYKxSNC4LXpsuwVPtDTCOdu3015Y1N41JgFowsojka4%2BUl%2BEheqYdq0vgQZhuTOaqPfbkDJZvUkSEp%2FtGxK%2BMfCcMyaK0SadQ5TDK7kU826PfFs9GIetOGXCI%2Ft6O%2F3lzOciiuwvwRSWP8UntcoriXbqhZcsEVKZqocWWUliH1IBq5h4ebyX1TbwLBSbSEZIDkkSF%2FxfaApyy5n%2BfOVmwAWkDUk97x2wDQieyRT1raXQKe8gV8X7uhLmSGlhowqVSFT1g2rpGpAcKEZv4GUe4zW7Bl7Ve5fAdF7I7OBViYPzwsd4za%2BBF3b6DYZwFzB8LmCWBuxh9eNeKou1RkyeKHE%2B9LKIbn3gEkoPxDXbyUT%2Ffl0JxPsd8Fz9vhNyFVD6AHDRZNyC2%2BXGSQdb51xobQ2tRhS2%2FjS%2FNHKoEUkS6kkWiSBc6HIDq4TEs6dm8CyD0Wd7XMaLHMqoijIVHcUstwxA%2FOvgdopE8Fv3l16NBu1xB%2B1S4xARQV%2Fbt15XCdQOD4xuxfGTx3QPqpiwHfdAzWreUgcLIbu9EEYHCxVktIVkfUjWSIvzhETzTAXm%2FTZyLm%2BjHhdBSsVTY1zMGquonpQHvc4rCtV%2FpPc61Loqgx6c9Pi9%2FqzauTf6cyj3ued3n7JO6T90qvsqxz03DTew%2B6wT3Wf%2Bn%2B5zDxoW67LuQ%2FodKhuzMP%2B9EIDasqtDiTnzIElOaFDO14%2FIYrbYOXo7Ync44JDwYO0I0i%2BSD8PSbaPEHa3dZVnqx%2BKHYWkh3IJZkRsepgzr%2FxuKM6H%2B1wbf%2FAU%3D

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
 
