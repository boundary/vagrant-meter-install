#!/bin/bash

# Define constant of the meter installation script name
typeset -r SETUP_SCRIPT="setup_meter.sh"

# Called at the end of the script execution to cleanup
function finish {
  rm -rf "$SETUP_SCRIPT" 2>&1 > /dev/null
}

# Call our function to clean up on exit
trap finish EXIT

# Reports an error and then exits with non-zero status
function LogErrorAndExit()
{
  typeset -r message=$1
  echo "$(date): $message" >&2
  exit 1
}

# Check to see if API_TOKEN environment is set,
if [ -z "$API_TOKEN" ]
then
  LogErrorAndExit "API_TOKEN environment variable not set with TrueSight Pulse API token"    
fi

# Check to see if curl is installed on the target
type curl  2>&1 > /dev/null 
if [ $? -ne 0 ]
then
   LogErrorAndExit "TrueSight Pulse Meter installations requires that the curl command is installed."
fi

# Create read-only constants
typeset -r DATA="{\"token\":\"$API_TOKEN\"}"
typeset -r HEADER='Content-Type: application/json'
typeset -r URL='https://meter.boundary.com/setup_meter'

# Download to the script to the current directory
curl -fsS -d "$DATA" -H "$HEADER" "$URL" 2> /dev/null > "$SETUP_SCRIPT"

# Check if download is successful, if not report error and exit
if [ $? -ne 0 ]
then
  LogErrorAndExit "Failed to download $SETUP_SCRIPT"  
fi

# Execute meter installation script
bash $SETUP_SCRIPT 2>&1 > /dev/null
typeset -i rc=$?
if [ $rc -ne 0 ]
then
  LogErrorAndExit "Meter installation $SETUP_SCRIPT failed."  
fi

exit $rc
