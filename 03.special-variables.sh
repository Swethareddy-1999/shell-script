#!bin/bash

echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "Home directory of cureent user: $HOME"
echo "Which user is running this script: $USER"
echo "Process id of current script: $$"
sleep 60 & #here & is sleep will run in back ground
echo "process id of last command in background: $!"  #it will give process id of sleep
