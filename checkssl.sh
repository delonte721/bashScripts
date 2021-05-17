#!/bin/bash
#checkssl

URL=$1
host=`curl -vI $URL 2>&1 | grep Host | head -n 1 | tr -d '>'`
start=`curl -vI --silent $URL 2>&1 | grep start | tr -d '*'`
expire=`curl -vI --silent $URL 2>&1 | grep expire | head -n 1 | tr -d '*'` 
server_cert=`curl -vI --silent $URL 2>&1 | grep cert | tr -d '*' | tail -n 3`
subject=`curl -vI --silent $URL 2>&1 | grep subject | tr -d '*'| head -n 1`
issuer=`curl -vI --silent $URL 2>&1 | grep issuer | tr -d '*'`

if [ $# -lt 1 ]; then
	echo ""
	echo "This script will verify and show the URL's SSL cert information"
	echo "--- Incorrect Syntax ----"
	echo "Usage: ./checkssl.sh <URL>"
	echo "Example: ./checkssl.sh https://constellix.com"
	echo ""
	exit
fi

echo $host
echo $start
echo $expire
echo $server_cert
echo $subject
echo $issuer