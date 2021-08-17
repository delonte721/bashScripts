#!/bin/bash
#checkdsrecord

if [ $# -lt 1 ]; then
	echo ""
	echo "This script will show the DS record of a single FQDN and a list of FQDNs"
	echo "--- Incorrect Syntax ----"
	echo "Single FQDN"
    echo "Usage: dsrecord <domain> / dsrecord <domain> nospace"
    echo "Example: dsrecord constellix.com"
    echo "Example: dsrecord.sh constellix.com nospace"
	echo "File List of FQDNs"
	echo "Usage: dsrecord <file_name> / dsrecord <file_name>"
	echo "Example: dsrecord testgroupdomains.txt"
	echo "Example: dsrecord testgroupdomains.txt nospace"
	echo ""
	exit
fi
nameserver1="@ns1.dnsmadeeasy.com"
nameserver2="@ns10.dnsmadeeasy.com"
dsrecord1=`dig +short $nameserver1 $1 in cds`
dsrecord2=`dig +short $nameserver2 $1 in cds`
keyID=`echo "$dsrecord2" | awk '{print $1}'`
