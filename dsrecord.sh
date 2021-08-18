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
keyID=`echo "$dsrecord_1" | awk '{print $1}'`
algorithm=`echo "$dsrecord_1" | awk '{print $2}'`
digest_type=`echo "$dsrecord_1" | awk '{print $3}'`
digest=`echo "$dsrecord_1" | awk '{print $4}'`
digest_2=`echo "$dsrecord_1" | awk '{print $5}'`
keyID2=`echo "$dsrecord_2" | awk '{print $1}'`
algorithm2=`echo "$dsrecord_2" | awk '{print $2}'`
digest_type2=`echo "$dsrecord_2" | awk '{print $3}'`
digest2=`echo "$dsrecord_2" | awk '{print $4}'`
digest22=`echo "$dsrecord_2" | awk '{print $5}'`
if [ -f $1 ]; then
	filename=$1
	while read FQDN; do
	# reading each line
	echo "DNSSEC has been enabled for $FQDN:"
	dsrecord_v2=`dig +short $nameserver_1 $FQDN in cds`
	if [[ $dsrecord_v2 ]]; then
		echo "KeyID:$keyID"
		echo "Algorithm:$algorithm"
		echo "Digest Type:$digest_type"
		echo "Digest:$digest$digest_2"	
		echo ""
	else
		echo "KeyID:$keyID2"
		echo "Algorithm:$algorithm2"
		echo "Digest Type:$digest_type2"
		echo "Digest:$digest2$digest22"
		echo ""
	fi 
	done < $filename
else
	echo "DNSSEC has been enabled for $1:"	
	if [[ $dsrecord_1 ]]; then
		echo "KeyID:$keyID"
		echo "Algorithm:$algorithm"
		echo "Digest Type:$digest_type"
		echo "Digest:$digest$digest_2"
	else
		echo "KeyID:$keyID2"
		echo "Algorithm:$algorithm2"
		echo "Digest Type:$digest_type2"
		echo "Digest:$digest2$digest22"
	fi
fi