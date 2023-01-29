Task Linux Bash
=====================
Task A: Create a script that uses the following keys:
----------
1. When starting without parameters, it will display a list of possible keys and their description.
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
3. The --target key displays a list of open system TCP ports.
The code that performs the functionality of each of the subtasks must be placed in a separate function

[Script](https://github.com/imospan/Cloud_DevOps-Fundamentals/blob/main/Bash/A/task_a.sh) and screenshot:\
![screen_a](https://user-images.githubusercontent.com/106439773/215318364-11a0793a-e43e-48b2-8cc4-a15e4daff8bf.png)

Task B: Using Apache [log example](https://github.com/imospan/Cloud_DevOps-Fundamentals/blob/main/Bash/B/example_log.log) create a script to answer the following questions:
----------------
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to?
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP)

[Script](https://github.com/imospan/Cloud_DevOps-Fundamentals/blob/main/Bash/B/task_b.sh) and screenshots:\
![logscreen1](https://user-images.githubusercontent.com/106439773/215318395-7a9e3286-07f5-4884-b2f5-215658a88572.png)
![logscreen2](https://user-images.githubusercontent.com/106439773/215318400-9e7cf6f7-250d-4856-956c-c2ce8495d3aa.png)
![apachescreen](https://user-images.githubusercontent.com/106439773/215318404-71d751e4-e79c-4784-a569-49a06808c11a.png)


Task C: Create a data backup script that takes the following data as parameters:
----------------------
1. Path to the syncing directory.
2. The path to the directory where the copies of the files will be stored.
In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]
