#!/bin/bash
function dmecheck {
    apiKey='3bd047f4-11e5-43e7-bceb-a5d36cee6cfa'
    secretKey='8f4512be-a40b-4af0-a8f0-d81f4f7742d4'
    time=`date -u +"%a, %d %b %Y %H:%M:%S GMT"`
    hmac=`echo -n "$time" | openssl dgst -sha1 -hmac "$secretKey"`
    token="$apiKey:$hmac:$time"
    curl --location --request GET 'https://api.dnsmadeeasy.com/V2.0/dns/managed/' 2>&1\
    --header 'Content-Type: application/json' \
    --header "x-dnsme-hmac: $hmac" \
    --header "x-dnsme-apiKey: $apiKey" \
    --header "x-dnsme-requestDate: $time"
}

function sonarcheck {
    apiKey='5b60e11f-f974-45d0-9513-b76756eb237b'
    secretKey='9d7714dd-82ad-4047-a46f-c80fff9e4a0a'
    time=`echo $(($(date +'%s * 1000 + %-N / 1000000')))`
    hmac=`echo -n "$time" | openssl dgst -sha1 -hmac "$secretKey" -binary | base64`
    token="$apiKey:$hmac:$time"
    curl --location --request GET 'https://api.sonar.constellix.com/rest/api/http' 2>&1\
    --header "x-cns-security-token: $token" \
    --header "Content-Type: application/json"
}

function constellixdnscheck {
    apiKey='5b60e11f-f974-45d0-9513-b76756eb237b'
    secretKey='9d7714dd-82ad-4047-a46f-c80fff9e4a0a'
    time=`echo $(($(date +'%s * 1000 + %-N / 1000000')))`
    hmac=`echo -n "$time" | openssl dgst -sha1 -hmac "$secretKey" -binary | base64`
    token="$apiKey:$hmac:$time"
    curl --location --request GET 'https://api.dns.constellix.com/v1/domains' 2>&1\
    --header "x-cns-security-token: $token" \
    --header "Content-Type: application/json"
}

echo "Testing DNS Made Easy"
dme=`dmecheck | grep bye.com`
if [ ! -z $dme ]; then
    echo "Works"
else
    echo "Broken"
fi
echo
echo "Testing Sonar"
sonar=`sonarcheck | grep delontestewart.info`
if [ ! -z $sonar ]; then
    echo "Works"
else
    echo "Broken"
fi
echo
echo "Testing Constellix DNS"
dns=`constellixdnscheck| grep sampledomain721.com`
if [ ! -z $dns ]; then
    echo "Works"
else
    echo "Broken"
fi
