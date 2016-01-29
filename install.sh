#!/bin/bash

# Check to see if curl is installed on the target
type curl > /dev/null 2>&1

function LogErrorAndExit()
{
  typeset -r message=$1
  echo "$(date): $message" > &2
  exit 1
}

# Check to see if API_TOKEN environment is set,
if [ -z "$API_TOKEN"]
then
  LogErrorAndExit "API_TOKEN environment variable not set with TrueSight Pulse API token"    
fi

if [ $? -eq 0 ]
then
  echo "$(date): $(basename $0) requires curl command to run" > &2
  exit 1
else
  # Create read-only constants
  typeset -r DATA="{\"token\":\"$API_TOKEN\"}"
  typeset -r HEADER='Content-Type: application/json'
  typeset -r URL='https://meter.boundary.com/setup_meter'
  typeset -r SETUP_SCRIPT="setup_meter.sh"

  # Download to the script to the current directory
  curl -fsS -d "$DATA" -H "$HEADER" "$URL" > "$SETUP_SCRIPT"

  # Check if download is successful, if not report error and exit
  if [ $? -ne 0 ]
  then
    LogErrorAndExit "Failed to download $SETUP_SCRIPT"  
  fi

  # Execute meter installation script
  bash $SETUP_SCRIPT
  if [ $? -ne 0 ]
  then
    LogErrorAndExit "Meter installation $SETUP_SCRIPT failed."  
  fi

fi
