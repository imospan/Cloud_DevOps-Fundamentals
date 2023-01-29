#!/bin/bash

show_help(){
echo "You have to use one parameter:
--all - to display IP addresses and symbolic names of all hosts in the current subnet\n
--target  - to display a list of open system TCP ports"
}


hosts () {
arp -a

#alternative way - with nmap (needs to be installed). Unhash to use nmap version.
#nmap -sn 192.168.0.1/24 | grep -i 'report for' | sed 's/Nmap scan report for/Found ip adre$
}


ports () {
  if [[ `/usr/bin/which netstat` ]]
  then
    echo "$(sudo netstat -tlpn | grep LISTEN | awk '{print $1,$4,$7}')"
  else
    echo -e "To run this script you have to install \"netstat\""
  fi
}


if [ "$1" = "--all" ]; then
  hosts
  elif [ "$1" = "--target" ]; then
    ports
else
  show_help
fi
