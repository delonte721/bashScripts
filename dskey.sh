#!/bin/bash
#checkdsrecord/key

if [ $# -lt 1 ]; then
	echo ""
	echo "This scripti will verify and show the URL's SSL cert information. Adding dates will only show the host, start, and expire dates of SSL cert"
	echo "--- Incorrect Syntax ----"
    