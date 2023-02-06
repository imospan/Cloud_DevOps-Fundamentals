Here be dragons\
In progress, TO DO: will complete it in 1-2 days.

Task Linux networking
==========================
Task is described [here](https://github.com/imospan/Cloud_DevOps-Fundamentals/blob/main/Networking/Task_Linux_Net.pdf).

Due to task conditions, my address configuration will look like this:\
Net1 network address: 192.168.1.0/24\
Net2 network address: 10.88.23.0/24\
Net3 network address: 10.6.88.0/24\
Net4 network address: 172.16.23.0/24

I've used Ubuntu 22.04 VM's for Server and Client1 and CentOS 7 for Client2. First of all, I've configured network interfaces in Oracle VirtualBox (Bridged and internal Net2, Net3 for server, internal Net2, Net4 for Client1 and internal Net3, Net4 for Client2).

1. Configure static interfaces on Server:\
Server's netplan and ip show:\


Client1 netplan:\

Client2 enp0s8 static:\
