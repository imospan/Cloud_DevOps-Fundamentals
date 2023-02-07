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
4. Add two IP addresses on the virtual interface lo on Client1 and configure routes.
On a Client1:
```
sudo ip addr add 172.17.33.1/24 dev lo label lo:10
sudo ip addr add 172.17.43.1/24 dev lo label lo:20
```
On a Client2: ```sudo ip route add 172.17.43.0/24 via 172.16.23.1```\
On a Server: ```sudo ip route add 172.17.33.0/24 via 10.88.23.11```\
Result:
```
[mosya@localhost ~]$ traceroute 172.17.43.1
traceroute to 172.17.43.1 (172.17.43.1), 30 hops max, 60 byte packets
 1  172.17.43.1 (172.17.43.1)  0.678 ms  0.566 ms  0.615 ms
[mosya@localhost ~]$ traceroute 172.17.33.1
 1   10.6.88.1  0.232ms  0.232ms  0.273ms
 2   172.17.32.1  0.405ms  0.432ms  0.506ms
 ```
 
________________________________________
5. Summarizing\
172.17.33.0 = 10101100.00010001.0010 0001.00000000\
172.17.43.0 = 10101100.00010001.0010 1011.00000000\
Matching Network Bits = 20\
Supernet IP: 172.17.32.0\
Supernet Subnet Mask: 255.255.240.0 (/20 prefix)

Added new route rule with `sudo ip route add 172.17.32.0/20 via 10.6.88.1`
_____________________
6. Establish SSH connection 
Install and start SSH server on Server VM:\
`sudo apt install openssh-server`\
`sudo systemctl start ssh`\
On Client1 and Client2:\
`ssh-keygen`\
`ssh-copy-id -i ~/.ssh/id_rsa.pub mosya@192.168.0.200`\
`ssh mosya0@192.168.0.200`\
![Знімок екрана_20230206_200613](https://user-images.githubusercontent.com/106439773/217187038-ff481f2a-8f2d-4a78-b2fe-562e299eb1c7.png)
![Знімок екрана_20230206_200600](https://user-images.githubusercontent.com/106439773/217187077-991f23a4-8738-48e8-9044-28f4ea5e987a.png)


____________________________
7. Server firewall configuration\
Disabling SSH connection from Client2:\
On server: `sudo iptables -A INPUT -i enp0s9 -p tcp --dport 22 -j DROP`\
As we can see on a screen, connection from Client2 in no longer vaild:\
![Знімок екрана_20230206_201649](https://user-images.githubusercontent.com/106439773/217187156-591e0cf3-fb4e-41cf-b304-80ac6ee6e07c.png)

Disabling ping for 172.17.43.1:\
On Client1: `sudo iptables -A INPUT -p icmp --icmp-type 8 -d 172.17.42.1 -j REJECT`\
Before and after rule implementation:\
![Знімок екрана_20230206_201958](https://user-images.githubusercontent.com/106439773/217187198-40c9444b-643c-45a1-8fbc-543eb5000e3b.png)

______________________________________
8. NAT configuration.\
To configure NAT masquerading on a server I've used command: `sudo iptables -t nat -A POSTROUTING -j MASQUERADE`\
Screens before/after rule implementation on both clients:\
![Знімок екрана_20230207_101600](https://user-images.githubusercontent.com/106439773/217190005-28874373-a73b-42fc-a924-99bc013d1eeb.png)
![Знімок екрана_20230207_101630](https://user-images.githubusercontent.com/106439773/217190019-d14f5875-629a-4d57-ab86-7c22e40df387.png)


