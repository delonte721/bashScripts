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
nameserver_1="@ns1.dnsmadeeasy.com"
nameserver_2="@ns10.dnsmadeeasy.com"
dsrecord_1=`dig +short $nameserver_1 $1 in cds`
dsrecord_2=`dig +short $nameserver_2 $1 in cds`
keyID=`echo "$dsrecord_2" | awk '{print $1}'`
algorithm=`echo "$dsrecord_2" | awk '{print $2}'`
digest_type=`echo "$dsrecord_2" | awk '{print $3}'`
digest=`echo "$dsrecord_2" | awk '{print $4}'`
digest_2=`echo "$dsrecord_2" | awk '{print $5}'`

