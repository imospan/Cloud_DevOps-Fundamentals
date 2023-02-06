Task Linux networking
==========================
Task is described [here](https://github.com/imospan/Cloud_DevOps-Fundamentals/blob/main/Networking/Task_Linux_Net.pdf).

Due to task conditions, my address configuration will look like this:\
Net1 network address: 192.168.1.0/24\
Net2 network address: 10.88.23.0/24\
Net3 network address: 10.6.88.0/24\
Net4 network address: 172.16.23.0/24

I've used Ubuntu 22.04 VM's for Server and Client1 and CentOS 7 for Client2. First of all, I've configured network interfaces in Oracle VirtualBox (Bridged and internal Net2, Net3 for server, internal Net2, Net4 for Client1 and internal Net3, Net4 for Client2).
__________________________
1. Configure static interfaces on Server:\
Server's netplan and ip show:\
![sv_netplan](https://user-images.githubusercontent.com/106439773/217015042-6d483659-fd95-4f37-8d2f-94fc56d90c25.png)
![sv_show](https://user-images.githubusercontent.com/106439773/217015057-0e71906c-207f-4ec3-9422-3323c73388e6.png)


Client1 netplan:\
![cl1_netplan](https://user-images.githubusercontent.com/106439773/217015080-ab423dde-f972-4618-b3cd-7767782211f7.png)

Client2 enp0s8 static:\
![Знімок екрана_20230206_161241](https://user-images.githubusercontent.com/106439773/217015629-22c99c2a-1fea-4ee2-babf-c100f2b698f1.png)
__________________________
2. Configure DHCP.\
At first, install DHCP server with ```sudo apt install isc-dhcp-server```\
Added config in `/etc/dhcp/dhcpd.conf`:
![Знімок екрана_20230206_162501](https://user-images.githubusercontent.com/106439773/217015672-f0dc004f-4d5d-4a91-97cc-029b965d2e6e.png)

Restart service to apply changes: ```sudo systemctl restart isc-dhcp-server```\
Enable ip forwarding with ```sudo sysctl -w net.ipv4.ip_forward=1```
___________________________
3. Check connection between VMs with ping and traceroute commands:

From server to Client1:\
![Знімок екрана_20230206_171353](https://user-images.githubusercontent.com/106439773/217015447-882ad7f9-4767-4489-a447-b047f0f2d4fc.png)\
From server to Client2:\
![Знімок екрана_20230206_171420](https://user-images.githubusercontent.com/106439773/217015510-88e26f26-13a5-46e1-a34e-718ac14b41e9.png)

From Client1:\
![Знімок екрана_20230206_173254](https://user-images.githubusercontent.com/106439773/217015284-20b8541b-f994-4c9d-af82-7915051e49df.png)

From Client2:\
![Знімок екрана_20230206_173315](https://user-images.githubusercontent.com/106439773/217015233-81c6fd0b-bb1c-436f-bbbf-b7471ee5e6e1.png)
___________________________
4. Add two IP to lo on Client1 and configure particular roles.

