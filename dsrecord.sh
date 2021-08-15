#!/bin/bash
#checkdsrecord

if [ $# -lt 1 ]; then
	echo ""
	echo "This script will show the DS record of a single FQDN and a list of FQDNs"
	echo "--- Incorrect Syntax ----"
	echo "Single FQDN"
    echo "Usage: dsrecord <domain> / dsrecord <domain> nospace"
    echo "Example: dsrecord constellix.com"
    echo "Example: dsrecord constellix.com nospace"
	echo "File List of FQDNs"
	echo "Usage: dsrecord <file_name> / dsrecord <file_name>"
	echo "Example: dsrecord testgroupdomains.txt"
	echo "Example: dsrecord testgroupdomains.txt nospace"
	echo ""
	exit
fi
tld=`echo $FQDN | awk -F '.' '{print $2}'`
nameserver=`host -t ns $tld | grep 'name server' | head -n 1 | awk '{print $4}'`
dsrecord=`dig +short $nameserver $FQDN in cds`
echo $dsrecord