#!/bin/bash
#   _____             _                      ____               _     
#  / ____|           | |                    |  _ \             | |    
# | |     _   _  ___ | |_  ___   _ __ ___   | |_) |  __ _  ___ | |__  
# | |    | | | |/ __|| __|/ _ \ | '_ ` _ \  |  _ <  / _` |/ __|| '_ \ 
# | |____| |_| |\__ \| |_| (_) || | | | | | | |_) || (_| |\__ \| | | |
#  \_____|\__,_||___/ \__|\___/ |_| |_| |_| |____/  \__,_||___/|_| |_| By Suyog kulkarni for Suyog kulkarni 😈
# 

## To make this work
## Open you bash bashrc or zshrc
## and add ~/.very_fun_custom_commands.sh to it
## And run source zshrc / bashrc
## Wolla crackhead commands ready to use

## Note:
## This script is still in progress does not contain all of the things from my 
## local will be updated when free 

## source
save () { source ~/.my_custom_commands.sh ;}

## Colors & Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NC='\033[0m'  # No Color

function sup(){
echo "\n"
cat << "EOF"
       _____ __  ___  ______  ___________    ____  ___   _____ __  __
      / ___// / / \ \/ / __ \/ ____/ ___/   / __ )/   | / ___// / / /
      \__ \/ / / / \  / / / / / __ \__ \   / __  / /| | \__ \/ /_/ / 
     ___/ / /_/ /  / / /_/ / /_/ /___/ /  / /_/ / ___ |___/ / __  /  
    /____/\____/  /_/\____/\____//____/  /_____/_/  |_/____/_/ /_/   
                                                                                                                                                 
EOF
echo '\t Hi Boss' '\ ^_^ /'
echo '\n'
echo '\t -------- Here are the system updates ---------\n'
echo '\t Time: '$(date) '\n'
echo '\t' $(top -l 1 | grep -E "^CPU") '\n'
echo '\t' $(top -l 1 | grep -E "^Phys")
echo ''
}

## Folders
root () { cd ~ ;}
ws () { cd $HOME/Documents/workspace/$1 ;}
pst () { cd $HOME/Documents/workspace/positsource/$1 ;}
tc () { cd $HOME/Documents/workspace/tinyclues/$1 ;}
back () { cd $(printf '../%.0s' $(seq 1 $1)) ;}

setup () {
##### Can be updated in future, for now harcoded seems convenient to me
  PARENT_FOLDER="$HOME/Documents"
  WORKSPACE_PATHS=(
    "${PARENT_FOLDER}/workspace" 
    "${PARENT_FOLDER}/workspace/positsource"
    "${PARENT_FOLDER}/workspace/tinyclues"
    "${PARENT_FOLDER}/workspace/tinyclues/gitlab"
    "${PARENT_FOLDER}/workspace/tinyclues/github"
  )
  if [ -d $PARENT_FOLDER ]; then
    for folder in ${WORKSPACE_PATHS[@]} 
    do
      if [ ! -d $folder ]; then
        mkdir $folder
        echo "✅ Created ${BOLD_GREEN}$folder${NC}."
      else
        echo "❌ ${BOLD_RED}${folder}${NC} is already present."
      fi
    done
  else
    echo " ${BOLD_RED}$PARENT_FOLDER${NC} missing 🚫 "
  fi
}

## Git functions
status () { git status ;}
branch () { echo "\n On ${BOLD_RED}$(git rev-parse --abbrev-ref HEAD)${NC}" ;}
git_current_origin () {git ls-remote --get-url | sed -e 's/^.*\://' | sed -e 's/\.git.*//' ;}
ghpull () {open "https://github.com/$(git_current_origin)/pull/new/$(branch)" ;}
glpull () {open "https://gitlab.com/$(git_current_origin)/pull/new/$(brnach)" ;}

function git_folder(){
  url=$1
  folder_name=$(basename -s .git "$url")
  cd $folder_name
}

function clone(){
  echo "Cloning repo into workspace!"
  sleep 1
  ws
  sleep 1
  git clone $1
  sleep 2
  git_folder $1
  echo "\n${BOLD_GREEN}Using remote,${NC}"
  git remote -v
}

function new_project(){
  ws
  sleep 1
  mkdir $@
  sleep 1
  cd $@
  sleep 1
  git init -b develop
  echo "INFO: Initilized new project 🔫"
}

## Pipenv
function cpipenv(){
if command -v pipenv &> /dev/null; then
    echo "pipenv is installed."
else
    if command -v pip &> /dev/null; then
        echo "pipenv is not installed. Please install it using 'pip install pipenv'."
    elif command -v pip3 &> /dev/null; then
        echo "pipenv is not installed. Please install it using 'pip3 install pipenv'."
    else
        echo "pipenv is not installed, and neither pip nor pip3 is found in the PATH. Please install pip or pip3 and then run 'pip install pipenv'."
    fi
fi
}

## Utils
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
port () { echo "\n$(sudo lsof -i -P | grep $1)\n" ;}
h () { history | grep $1 ;}
c () { clear ;}
e () { exit ;}

function show_folder(){
  echo 'finding' $1
  mdfind kind:folder $1
}

function remind_me(){
    reminder_name="$1"
    reminder_date="${4:-$(date +'%d/%m/%Y')}"
    reminder_time="${2:-$(date +'%I:%M%p')}"
    data=$(osascript -e "tell application \"Reminders\" to make new reminder with properties {name:\"$reminder_name\", due date:date \"$reminder_date $reminder_time\"}")
    echo "\nReminder set successfully! \n$data \nTitle: $reminder_name \nTime: $reminder_time"
}

## Fun / dumb things
function war(){
  cat << "EOF"
       _,.
     ,` -.)
    '( _/'-\\-.               
   /,|`--._,-^|            ,     
   \_| |`-._/||          ,'|       
     |  `-, / |         /  /      
     |     || |        /  /       
      `r-._||/   __   /  /  
  __,-<_     )`-/  `./  /
 '  \   `---'   \   /  / 
     |           |./  /  
     /           //  /     
 \_/' \         |/  /         
  |    |   _,^-'/  /              
  |    , ``  (\/  /_        
   \,.->._    \X-=/^         
   (  /   `-._//^`  
    `Y-.____(__}              
     |     {__)           
           ()`     
EOF
}

function ok(){
cat << "EOF"
  ████████████████████████████████████████
  ████████████████████████████████████████
  ██████▀░░░░░░░░▀████████▀▀░░░░░░░▀██████
  ████▀░░░░░░░░░░░░▀████▀░░░░░░░░░░░░▀████
  ██▀░░░░░░░░░░░░░░░░▀▀░░░░░░░░░░░░░░░░▀██
  ██░░░░░░░░░░░░░░░░░░░▄▄░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░░░░░░░░░█░█░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░░░░░░░░▄▀░█░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░████▄▄▄▀░░▀▀▀▀▄░░░░░░░░░░░██
  ██▄░░░░░░░░░████░░░░░░░░░░█░░░░░░░░░░▄██
  ████▄░░░░░░░████░░░░░░░░░░█░░░░░░░░▄████
  ██████▄░░░░░████▄▄▄░░░░░░░█░░░░░░▄██████
  ████████▄░░░▀▀▀▀░░░▀▀▀▀▀▀▀░░░░░▄████████
  ██████████▄░░░░░░░░░░░░░░░░░░▄██████████
  ████████████▄░░░░░░░░░░░░░░▄████████████
  ██████████████▄░░░░░░░░░░▄██████████████
  ████████████████▄░░░░░░▄████████████████
  ██████████████████▄▄▄▄██████████████████
  ████████████████████████████████████████
  ████████████████████████████████████████
EOF
}


function horse(){
cat << "EOF"
        ,--,  
  _ ___/ /\|
 ;( )__, )
; //   '--;
  \     |   
   ^    ^   
EOF
}

