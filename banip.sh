#!/bin/bash
#author: Lucas Ludziejewski 
# script to get IP's from /etc/hosts.deny and ban them via iptables
#############################################################################################################

IP=`grep ALL: /etc/hosts.deny | gawk -F"ALL:" '{print $2}' | grep -v "some.host" | grep -v "PARANOID"`



for i in `grep ALL: /etc/hosts.deny | gawk -F"ALL:" '{print $2}' | grep -v "some.host" | grep -v "PARANOID"`;
do
	iptables -A INPUT -s $i -j DROP
	echo "$i banned via iptables"
done

exit 0;

