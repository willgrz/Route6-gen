#!/bin/bash
ip6networklist=$(cat networks.txt)

for ipv6network in $ip6networklist; do
#echo $ipv6network
pingable=$(echo $ipv6network | sed -e 's/\/43/1/')
#echo $pingable
netname=$(whois -h whois.ripe.net -r $ipv6network | grep 'descr:' | sed -e 's/descr://' | xargs)
#echo $netname
echo "ROUTE6:          $ipv6network"
echo "DESCR:           $netname"
echo 'ORIGIN:          AS198412'
echo "pingable:        $pingable"
echo 'org:             ORG-WW24-RIPE'
echo 'remarks:         Unicast object'
echo 'notify:          william@william.si'
echo 'mnt-lower:       WILLIAM-MNT'
echo 'mnt-routes:      WILLIAM-MNT'
echo 'MNT-BY:          WILLIAM-MNT'
echo 'changed:         william@william.si'
echo 'SOURCE:          RIPE'
echo -e '\n'
done

