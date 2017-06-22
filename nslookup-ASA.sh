## Script to perform nslookup from list of IP addresses and then format into network object in ASA config##
#!/bin/bash
rm nslookup.out    # blank the output file
ip1=/home/dflynn/scripts/ip-address.txt   #define file containing list of IP addresses
for i in `cat $ip1` ; do
        NAME=$(nslookup $i |sed -n '/arpa/s/.*arpa.*name = \(.*\)/\1/p'| cut -d . -f 1 |  tr [a-z] [A-Z])
        echo "object network WX-SVR-INT-$NAME"  >> nslookup.out
        echo "host $i" >> nslookup.out
        echo >> nslookup.out
done
