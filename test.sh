#!/bin/bash
#!/bin/bash
# Basic while loop script outputs a domain A records/IPv4 addresses 
echo "This is delontestewart.com and $1 A records"
counter=1
while [ $counter -le 50 ]
dos
	rand=`dig $1 +short`
	IP=`dig delontestewart.com +short`
	echo $counter $IP $rand
	((counter++))
done
echo All done

 
