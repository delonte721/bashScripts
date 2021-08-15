#!/bin/bash
#checkdsrecord/key

if [ $# -lt 1 ]; then
	echo ""
	echo "This script will show the FQDN's DS record information
	echo "Single FQDN"
	echo "Usage: dskey.sh <domain>"
	echo ""
	exit
fi
