#!/bin/bash
#checkdsrecord/key

if [ $# -lt 1 ]; then
	echo ""
	echo "This script will show the DS record of a single FQDN"
	echo "--- Incorrect Syntax ----"
	echo "Single FQDN"
    echo "Usage: dsrecord <domain> / dsrecord <domain> nospace"
    echo "Example: dsrecord constellix.com"
    echo "Example: dsrecord constellix.com nospace"
	echo "File List of FQDNs"
	echo "Usage: dsrecord <file_name> / dsrecord <file_name>"
	echo "Example: dsrecord testsslexpire.txt"
	echo "Example: dsrecord testsslexpire.txt nospace"
	echo ""
	exit
fi