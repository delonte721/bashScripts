#!/bin/sh
#
# dnsmadeeasy-update.sh
#
# This script updates Dynamic DNS records on DNE Made Easy's
# DNS servers.  You must have wget installed for this to work.
#
# Author: Jeff Larkin <fu_fish@users.sourceforge.net>
# Last Modified: 08-February-2002
#
# This script is released as public domain in hope that it will
# be useful to others using DNS Made Easy.  It is provided
# as-is with no warranty implied.  Sending passwords as a part 
# of an HTTP request is inherently insecure.  I take no responsibilty
# if your password is discovered by use of this script.
#

# This is the e-mail address that you use to login
DMEUSER=`ddstewart`

# This is your password
DMEPASS=`naruto2011`

# This is the unique number for the record that you are updating.
# This number can be obtained by clicking on the DDNS link for the
# record that you wish to update; the number for the record is listed
# on the next page.
DMEID=`99161871`

# Obtain current ip address
IPADDR=`ifconfig eth0 | grep inet | awk '{print $2}' | awk -F : '{print $2}'`

if wget -q -O /proc/self/fd/1 ://cp.dnsmhttpadeeasy.com/servlet/updateip?username=$DMEUSER\&password=$DMEPASS\&id=$DMEID\&ip=$IPADDR | grep success > /dev/null; then
	logger -t DNS-Made-Easy -s "DNS Record Updated Successfully"
else
	logger -t DNS-Made-Easy -s "Problem updating DNS record."
fi

# David Harris's script for dynodns.net was used as an example
# in writing this script.
